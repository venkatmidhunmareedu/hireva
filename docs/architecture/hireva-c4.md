# Architecture: Hireva

- Task: none
- Serves: REQ-003, REQ-018, REQ-024, REQ-025, REQ-026, REQ-031, REQ-032, REQ-037, REQ-039, REQ-041, REQ-045; US-00-004, US-00-005, US-01-007; ADR-0001 to ADR-0011
- Generated on 2026-10-21 by architecture-diagram, version 1
- Sources: the approved HLD (docs/design/hireva-hld.md) and the ADRs. There is no code, no compose file and no manifest yet, so every element and edge below is a design claim, not something found in code, and every edge is on the unconfirmed list.

Drawn images, from docs/architecture/architecture.json:
- ![System architecture](diagrams/Hireva_SystemArchitecture_v1.svg)
- ![Architecture flow](diagrams/Hireva_ArchitectureFlow_v1.svg)

## 1. Context

Four user roles come from the PRD (REQ-044): candidate, recruiter, org admin and interviewer. External systems come from the ADRs.

```mermaid
C4Context
  title System context: Hireva
  Person(cand, "Candidate", "Builds a portfolio and takes the voice interview")
  Person(rec, "Recruiter", "Posts jobs, scores scrubbed transcripts, selects")
  Person(adm, "Org admin", "Creates the organization and invites recruiters")
  Person(itv, "Interviewer", "Sees only assigned candidates, gives feedback")
  System(sys, "Hireva", "Anonymous interviews: identity stays hidden until selection")
  System_Ext(sup, "Supabase", "Sign-in and the PostgreSQL database")
  System_Ext(orr, "OpenRouter", "Language models for replies, proposals and scrubbing")
  System_Ext(res, "Resend", "Sends confirmation, reset and invitation emails")
  Rel(cand, sys, "Uses", "HTTPS and WebSocket")
  Rel(rec, sys, "Uses", "HTTPS")
  Rel(adm, sys, "Uses", "HTTPS")
  Rel(itv, sys, "Uses", "HTTPS")
  Rel(sys, sup, "Signs users in, reads and writes data", "HTTPS and SQL")
  Rel(sys, orr, "Sends cleaned text", "HTTPS")
  Rel(sup, res, "Sends auth emails", "SMTP")
```

## 2. Containers

Production view. There is no dev-only service yet.

```mermaid
C4Container
  title Containers: Hireva
  Person(user, "Users", "Candidate, recruiter, org admin, interviewer")
  System_Boundary(b, "Hireva on one Oracle VM, Docker Compose") {
    Container(caddy, "Caddy", "Caddy", "HTTPS, serves the web files, proxies to the API")
    Container(web, "Hireva Web", "React, Vite+", "Static single-page app")
    Container(api, "Hireva API", "Python 3.14, FastAPI", "Scrubber, model gateway, interviews, scoring, reveal")
    Container(speech, "Hireva Speech", "Moonshine, Kokoro", "Speech to text and text to speech")
  }
  ContainerDb(pg, "PostgreSQL", "Supabase", "Evaluator schema and a separate identity schema")
  System_Ext(auth, "Supabase Auth", "Email, password, Google")
  System_Ext(orr, "OpenRouter", "Language models")
  System_Ext(res, "Resend", "Auth emails")
  Rel(user, caddy, "Uses", "HTTPS and WSS")
  Rel(caddy, web, "Serves", "static files")
  Rel(caddy, api, "Proxies", "REST and the interview WebSocket")
  Rel(user, auth, "Signs up and in", "HTTPS")
  Rel(api, speech, "Streams audio and text", "internal HTTP and WebSocket")
  Rel(api, pg, "Reads and writes", "SQL, two roles")
  Rel(api, auth, "Checks tokens, invites users", "HTTPS")
  Rel(api, orr, "Sends cleaned text", "HTTPS")
  Rel(auth, res, "Sends emails", "SMTP")
```

## 3. Components: Hireva API

The container with the most modules. These packages are planned in the HLD and the tenets, not read from imports.

```mermaid
C4Component
  title Components: Hireva API
  Container_Boundary(c, "Hireva API") {
    Component(ses, "interview sessions", "module", "Socket per interview, admission control, order per turn")
    Component(det, "detector", "module", "Name detection with coarse categories, one for every caller")
    Component(scr, "scrubber", "module", "Two passes, fails closed")
    Component(gw, "model gateway", "module", "The only caller of OpenRouter, spend cap")
    Component(sc, "speech client", "module", "The only caller of Hireva Speech")
    Component(sco, "scoring", "module", "Rubric scores, flags, voiding")
    Component(org, "organizations", "module", "Memberships, invitations, role checks")
    Component(rev, "reveal", "module", "Only reader of the identity schema")
  }
  ContainerDb(pg, "PostgreSQL", "Supabase", "")
  System_Ext(orr, "OpenRouter", "")
  Container(speech, "Hireva Speech", "Moonshine, Kokoro", "")
  System_Ext(auth, "Supabase Auth", "")
  Rel(ses, sc, "Streams audio through")
  Rel(ses, scr, "Cleans each transcript with")
  Rel(scr, det, "First pass")
  Rel(scr, gw, "Second pass")
  Rel(ses, gw, "Asks for the reply")
  Rel(sc, speech, "Internal HTTP and WebSocket")
  Rel(gw, orr, "HTTPS")
  Rel(ses, pg, "Stores scrubbed turns", "SQL, app role")
  Rel(sco, pg, "Stores scores", "SQL, app role")
  Rel(org, pg, "Reads memberships", "SQL, app role")
  Rel(org, auth, "Invites users", "HTTPS")
  Rel(rev, pg, "Reads identity", "SQL, reveal role")
```

Skipped: none (nothing under 30 lines, because nothing is written).

## 4. Sequences

### One interview turn (the interview WebSocket, US-00-004, US-00-005)

No code exists, so this follows the HLD flow B and the order per turn in HLD section 7, not a traced path. Participants are the HLD's modules.

```mermaid
sequenceDiagram
  autonumber
  actor C as Candidate
  participant W as Hireva Web
  participant S as interview sessions
  participant K as speech client
  participant D as detector
  participant G as model gateway
  participant O as OpenRouter
  participant DB as PostgreSQL
  C->>W: speaks an answer
  W->>S: audio chunks over the interview WebSocket
  S->>K: audio stream
  K-->>S: final transcript after end of speech
  S->>D: clean the transcript with name detection
  D-->>S: cleaned text and replaced categories
  par agent reply
    S->>G: ask for the reply from the cleaned text
    G->>O: reply request
    O-->>G: reply text
    G-->>S: reply text
    S->>K: reply text to speech
    K-->>S: reply audio
    S-->>W: reply audio, the candidate hears it
  and scrubber model pass
    S->>G: model pass over the cleaned text
    G->>O: scrub request
    O-->>G: further cleaned text
    G-->>S: further cleaned text
  end
  alt both succeeded
    S->>DB: store the scrubbed turn and the reply
  else model pass or save failed after the reply was spoken
    S->>DB: store the reply marked orphaned, discard the turn
    S-->>W: the agent asks the question again
  else OpenRouter down
    S-->>W: holding line, then the interview pauses
  end
  Note over S,DB: transaction boundary around the turn store. A crash before the store resumes from the last stored turn
```

External side effect before the commit: the agent's reply is spoken before the turn is stored. The failure branch above says what is left: the candidate heard a reply, no candidate turn is stored, and the reply is kept marked orphaned.

## Legend

- Mermaid shapes are only those in the template: Person, System, System_Ext, Container, ContainerDb, Component, Rel.
- In the drawn SVG, a solid line is a request and reply, a dashed line is an event or message, a dashed box is outside our control, a cylinder marks the service that owns data.
- Skipped: the DeploymentArchitecture view (no deployment model yet), and the component views of Hireva Web and Hireva Speech (nothing to show before code).

## Sources

| Element | Source |
| --- | --- |
| Hireva Web, Hireva API, Hireva Speech, Caddy | docs/design/hireva-hld.md, section "What gets built" and section 3 |
| PostgreSQL, Supabase Auth | docs/adr/0001, docs/adr/0006 |
| OpenRouter | docs/adr/0003 |
| Resend | docs/adr/0011 |
| Hireva Speech models | docs/adr/0009 |
| Interview WebSocket | docs/adr/0010 |
| REST with OpenAPI | docs/adr/0008 |
| Caddy and Compose on one VM | docs/adr/0004, docs/adr/0005 |
| Detector, scrubber, model gateway, speech client, reveal | docs/architecture/tenets.md, docs/design/hireva-hld.md section 3 |
| Roles | docs/product/PRD.md, REQ-044 |

## Unconfirmed

All eight drawn edges and every element are inferred from the HLD and ADRs, because there is no code, no compose file and no client call to confirm them.
- Hireva Web to Caddy: inferred from ADR-0005 and HLD section 3.
- Hireva Web to Supabase Auth: inferred from HLD section 3 (the browser signs in through Supabase).
- Caddy to Hireva API: inferred from ADR-0005 and ADR-0010.
- Hireva API to Hireva Speech: inferred from ADR-0009.
- Hireva API to PostgreSQL: inferred from ADR-0001 and Q-023.
- Hireva API to Supabase Auth: inferred from ADR-0006 and US-01-010.
- Hireva API to OpenRouter: inferred from ADR-0003.
- Supabase Auth to Resend: inferred from ADR-0011.
- The module names in the component view: inferred from the HLD and tenets.

## Noticed

- The HLD says the diagram was "not drawn yet"; it is drawn now, so that line needs updating (done in the HLD).
- docs/architecture/repo-plan.json lists four repositories, but the diagram shows five boxes in the system (Caddy and Hireva Web are in two repositories, HirevaInfra and HirevaClient); nothing disagrees.
