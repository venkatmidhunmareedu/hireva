# Hireva

Anonymous hiring: a candidate is interviewed and scored without the evaluators seeing who they are, and identity is revealed only after selection. This repository holds the planning documents. The code will live in four other repositories (HirevaClient, HirevaApi, HirevaSpeech, HirevaInfra).

## Progress

Last updated: 2026-10-22

| Area | Done |
|---|---|
| Planning | 100% |
| Build | 0% (0 of 86 points) |

### Epics

| Epic | Name | Points | Done points | Done |
|---|---|---|---|---|
| EP-01 | Present myself without my identity | 11 | 0 | 0% |
| EP-02 | Open and apply to roles | 11 | 0 | 0% |
| EP-03 | Be interviewed without revealing who I am | 27 | 0 | 0% |
| EP-04 | Evaluate candidates on their work | 14 | 0 | 0% |
| EP-05 | Select, reveal and hire | 15 | 0 | 0% |
| EP-06 | Set up an organization and its people | 8 | 0 | 0% |
| **Total** | | **86** | **0** | **0%** |

### Stories

| Story | Epic | Title | Priority | Points | Done |
|---|---|---|---|---|---|
| US-00-001 | EP-01 | Maintain my portfolio | Must | 3 | 0% |
| US-00-002 | EP-01 | Check my portfolio for identity leaks | Must | 5 | 0% |
| US-00-012 | EP-01 | Sign up, sign in and reset a password | Must | 3 | 0% |
| US-00-003 | EP-02 | Apply to a job posting | Must | 3 | 0% |
| US-01-001 | EP-02 | Post a job with its persona and rubric | Must | 8 | 0% |
| US-00-004 | EP-03 | Take the automated agent interview | Must | 8 | 0% |
| US-00-005 | EP-03 | Scrub identity clues from the spoken interview | Must | 5 | 0% |
| US-00-006 | EP-03 | Type text or code in the platform editor | Must | 3 | 0% |
| US-00-007 | EP-03 | Join a voice call with chat | Should | 8 | 0% |
| US-00-008 | EP-03 | Take a written test | Could | 3 | 0% |
| US-00-009 | EP-04 | Submit interview feedback | Should | 2 | 0% |
| US-01-002 | EP-04 | Browse candidates without seeing who they are | Must | 3 | 0% |
| US-01-003 | EP-04 | Assign a candidate to an interviewer | Should | 3 | 0% |
| US-01-004 | EP-04 | Score a scrubbed interview transcript | Must | 3 | 0% |
| US-01-005 | EP-04 | Review interviewer feedback | Should | 1 | 0% |
| US-01-006 | EP-04 | Flag a missed identity clue | Should | 2 | 0% |
| US-00-010 | EP-05 | Respond to an offer | Could | 3 | 0% |
| US-00-011 | EP-05 | Submit onboarding documents | Could | 5 | 0% |
| US-01-007 | EP-05 | Select a candidate and reveal their identity | Must | 3 | 0% |
| US-01-008 | EP-05 | Send an offer | Could | 2 | 0% |
| US-01-009 | EP-05 | Set the onboarding documents | Could | 2 | 0% |
| US-01-010 | EP-06 | Create an organization and invite recruiters | Must | 5 | 0% |
| US-01-011 | EP-06 | Invite interviewers | Should | 3 | 0% |

## Planning status

| Item | Status | Where |
|---|---|---|
| Requirements (PRD) | Done | `docs/product/PRD.md` |
| Decisions register | Done, all confirmed | `docs/product/questions.md` |
| Backlog and coverage | Done, 23 stories | `docs/product/backlog.md`, `docs/product/coverage.md` |
| Estimate | Done, 86 points | `docs/product/` |
| High level design | Done, approved | `docs/design/hireva-hld.md` |
| Architecture and decisions | Done, 11 ADRs | `docs/architecture/`, `docs/adr/` |
| Planning gate | Passing (`make check`) | `Makefile` |
