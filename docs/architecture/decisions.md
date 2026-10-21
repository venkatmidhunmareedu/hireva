# Architecture decisions: Hireva

One row per decision, and every contradiction settled once so it is not settled again, differently, in each file that runs into it.

## Decisions

| Id | Title | Area | Status | Reversibility |
| --- | --- | --- | --- | --- |
| ADR-0001 | Use PostgreSQL for the system of record | database | Accepted | awkward: queries and the identity-split permissions would move |
| ADR-0002 | Use Python and FastAPI for the backend | backend language | Accepted | awkward: the API and the scrubber would be rewritten |
| ADR-0003 | Use OpenRouter as the language-model gateway | llm provider and models | Accepted | cheap: every call goes through one module |
| ADR-0004 | Host on Oracle Cloud Always Free | cloud | Accepted | cheap: containers move to another host with a new VM and DNS |
| ADR-0005 | Run on Docker Compose with Caddy | compute | Accepted | cheap: the same containers move to another orchestrator |
| ADR-0006 | Use Supabase Auth for sign-in | auth | Accepted | awkward: accounts and password hashes would be migrated |
| ADR-0007 | Use React with Vite+ for the frontend | frontend | Accepted | cheap: Vite+ wraps Vite, so plain Vite replaces it |
| ADR-0008 | Use REST with OpenAPI for the API | api style | Accepted | awkward: routes and the generated client would be rewritten |
| ADR-0009 | Self-host Moonshine and Kokoro for speech | speech stack | Accepted | cheap: speech goes through one module, so a hosted service replaces it |
| ADR-0010 | Carry interview audio and events on one WebSocket | api style | Accepted | awkward: the browser and API both speak this message format |
| ADR-0011 | Use Resend as the email sender for Supabase Auth | email | Accepted | cheap: only the SMTP settings change |

## Conflicts that were settled

### Can the scrubber's second pass send raw candidate text to the language model?

**Between:** US-00-005 (scrub speech with name detection plus a model pass), ADR-0003 (unscrubbed candidate text must never reach OpenRouter), Q-024.
**Decision.** The model pass runs only on text the name-detection pass has already cleaned. Direct clues (name, school, employer, city, spouse, nickname) are removed before any model sees the text; indirect clues such as "the college by the river" can still reach it.
**Why.** It keeps the no-raw-text rule from ADR-0003 and Q-024, at the price of a model that sees partly cleaned text.
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- US-00-005 keeps its acceptance criteria; its assumptions should name this order (name detection first, then the model pass).
- Tenet 3 in docs/architecture/tenets.md states the rule.

### How does live audio travel when ADR-0008 allows only one WebSocket, for the code box?

**Between:** ADR-0008, US-00-004, US-00-006, REQ-037.
**Decision.** One WebSocket per interview carries audio chunks, transcript events, the agent's audio and editor text, as ADR-0010 records. ADR-0010 extends ADR-0008; ADR-0008 stays Accepted.
**Why.** One connection per interview is the simplest thing that works at v1 volume and avoids keeping two connections in step.
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- ADR-0010 records the decision; ADR-0008 is not edited.
- api/openapi.yaml, when written, describes the socket and its message types.

### Can a Must story depend on a Should story?

**Between:** US-01-002 (Must), US-00-003 (was Should).
**Decision.** US-00-003 (apply to a job posting) is promoted to Must.
**Why.** US-01-002 lists applications; without US-00-003 there are none. It adds 3 points to the Musts.
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- docs/product/backlog.md: US-00-003 priority is now Must (done).
- docs/product/estimate.md: Must 44, Should 16 at the time (done); later totals are in the estimate.

### How fine are the clue categories the detector reports?

**Between:** US-00-002, US-00-005, US-00-006 (each clue "with its category"), Q-011 (school, employer, spouse, nickname), the spike results (name detection knows only person, organization and place).
**Decision.** One detector module in Hireva API gives coarse categories (person, organization, place). The leak check, the scrubber and the editor warning all call it. There is no second detector in the browser.
**Why.** Fine categories would need a model pass on raw portfolio text, which sends unscrubbed text to OpenRouter against ADR-0003. Coarse categories keep the rule.
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- Q-011 and Q-032 record the narrower categories (done).
- The acceptance criteria that say "category" read coarse; no id changes.

### Who sees a candidate's identity after the hiring is completed?

**Between:** Q-006 (recruiter only), the user's later answer (recruiters and interviewers), US-01-007.
**Decision.** The recruiters of the organization and the interviewers of that hiring see the identity when the hiring is completed, read as when the recruiter marks the candidate selected, and no one sees it before.
**Why.** The user said it is "not revealed until the hiring is completed for both interviewers and recruiters" (REQ-045, Q-031).
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- US-01-007 acceptance criterion 1 now names recruiters and assigned interviewers (done).
- Q-006 keeps its row with a dated reversal note (done).

### Who may read a posting's applications, transcripts and scores?

**Between:** the first HLD draft (the recruiter who created the posting), Q-015 and US-01-004 (a second person may score), the user's organization model.
**Decision.** All recruiters of the posting's organization may read them; an interviewer reads only the candidates assigned to them.
**Why.** An organization has its own recruiters and an org admin who invites them (REQ-041, REQ-044, Q-033).
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- HLD section 9 states organization scoping (done); US-01-010 and US-01-011 carry the criteria.

### What happens when the agent has spoken before the turn can be stored?

**Between:** HLD section 8 (the reply and the scrubber's model pass run in parallel), HLD section 7 (the turn is stored before the reply), Tenet 5, AC-US-00-005-5.
**Decision.** Keep them in parallel. If the model pass or the save fails after the reply was spoken, the reply stays in the transcript marked orphaned, the candidate's turn is discarded and the agent asks again. After a crash the interview resumes from the last stored turn.
**Why.** It keeps the 1.75 s budget; running the model pass first would add about 0.8 s and miss the 2 s target.
**Settled by:** user (project owner), 2026-10-21.
**What now has to change to match:**
- HLD sections 7 and 8 state the order (done).
- Tenet 5 names orphaned replies (done).
- AC-US-00-005-5 names both failure paths (done).
