# Coverage: PRD statements to stories

PRD: docs/product/PRD.md   Backlog: docs/product/backlog.md   Built: 2026-10-21

## Matrix

| REQ | Statement (short) | Judgement | Why | Covered by | AC ids |
| --- | --- | --- | --- | --- | --- |
| REQ-003 | The system reveals a candidate's identity only after the can... | story | Revealing identity on selection is something the recruiter does that changes what they see. | US-01-007 | AC-US-01-007-1, AC-US-01-007-2 |
| REQ-004 | A recruiter posts a job posting on the platform. | story | Posting a job is a new thing a recruiter can do. | US-01-001 | AC-US-01-001-1, AC-US-01-001-2 |
| REQ-005 | A candidate applies to a job posting through the platform. | story | Applying is a new thing a candidate can do. | US-00-003 | AC-US-00-003-1, AC-US-00-003-3, AC-US-00-003-4, AC-US-00-003-5 |
| REQ-006 | A candidate updates their own portfolio on the platform. | story | Maintaining a portfolio is a new thing a candidate can do. | US-00-001 | AC-US-00-001-1, AC-US-00-001-2 |
| REQ-007 | A candidate can apply for a role when the posting is relevant. | criterion-of US-00-003 | It is a condition on who may apply, not an action of its own. | US-00-003 | AC-US-00-003-2 |
| REQ-008 | A recruiter assigns a candidate to an interviewer. | story | Assigning a candidate to an interviewer is a new recruiter action. | US-01-003 | AC-US-01-003-1, AC-US-01-003-4 |
| REQ-009 | A recruiter receives the interviewer's feedback after the in... | split | It hides two actions: the interviewer submits feedback and the recruiter receives it. | US-00-009, US-01-005 | AC-US-00-009-1, AC-US-00-009-2, AC-US-01-005-1, AC-US-01-005-2 |
| REQ-010 | The system carries the whole recruitment process on the plat... | non-functional | A quality of the whole flow, carried as an AC where the candidate could be sent elsewhere. | US-00-004 | AC-US-00-004-5 |
| REQ-011 | The system never sends a candidate to another platform durin... | non-functional | The same quality seen from the candidate: no step leaves the platform. | US-00-004 | AC-US-00-004-5 |
| REQ-012 | The system includes the post-interview process on the platform. | split | Q-004 defines it as feedback, selection and reveal, offer and negotiation, and onboarding, which are stories of their own. | US-01-007, US-01-008 | AC-US-01-007-3, AC-US-01-008-3 |
| REQ-013 | The system hosts meetings on the platform. | story | Joining a voice call with chat is a new candidate action. | US-00-007 | AC-US-00-007-1, AC-US-00-007-3 |
| REQ-014 | The system hosts technical rounds on the platform. | criterion-of US-01-003 | The technical round is a round type of an assignment. | US-01-003 | AC-US-01-003-2 |
| REQ-015 | The system hosts HR rounds on the platform. | criterion-of US-01-003 | The HR round is a round type of an assignment. | US-01-003 | AC-US-01-003-3 |
| REQ-016 | The system hosts written tests on the platform. | story | Taking a written test is a new candidate action. | US-00-008 | AC-US-00-008-1, AC-US-00-008-2, AC-US-00-008-3 |
| REQ-017 | The system proctors written tests and coding tests. | out-of-scope | Q-002 decided proctoring is not in v1. (Q-002) | none | none |
| REQ-018 | The system runs an automated agentic interview. | story | Being interviewed by an agent is a new candidate action. | US-00-004 | AC-US-00-004-1, AC-US-00-004-2, AC-US-00-004-3 |
| REQ-019 | The system provides agent personas for the interview. | criterion-of US-01-001 | The persona is a setting on a job posting. | US-01-001 | AC-US-01-001-3, AC-US-01-001-4 |
| REQ-020 | The system supports a final manual interview. | criterion-of US-00-007 | The final interview is a voice call marked final. | US-00-007 | AC-US-00-007-5 |
| REQ-021 | The system provides an onboarding process after a candidate ... | story | Setting the onboarding documents is a new recruiter action. | US-01-009 | AC-US-01-009-1, AC-US-01-009-2 |
| REQ-022 | The system receives documents from a hired candidate during ... | story | Submitting onboarding documents is a new candidate action. | US-00-011 | AC-US-00-011-1, AC-US-00-011-4 |
| REQ-023 | The system reads submitted documents with OCR. | criterion-of US-00-011 | OCR is what happens to an uploaded document. | US-00-011 | AC-US-00-011-2, AC-US-00-011-3 |
| REQ-024 | The system flags identity-revealing content in a candidate's... | story | Checking a portfolio for leaks is a new candidate action. | US-00-002 | AC-US-00-002-1, AC-US-00-002-2, AC-US-00-002-3, AC-US-00-002-4, AC-US-00-002-5 |
| REQ-025 | The system removes identity clues from each interview messag... | story | Scrubbing messages is a new behaviour with its own failure cases. | US-00-005, US-01-006 | AC-US-00-005-1, AC-US-00-005-2, AC-US-00-005-3, AC-US-00-005-4, AC-US-00-005-5, AC-US-01-006-1, AC-US-01-006-2, AC-US-01-006-4 |
| REQ-026 | A recruiter scores the scrubbed interview transcript against... | story | Scoring a transcript is a new recruiter action. | US-01-001, US-01-004, US-01-006 | AC-US-01-001-5, AC-US-01-001-6, AC-US-01-004-1, AC-US-01-004-2, AC-US-01-006-3 |
| REQ-027 | A candidate types code into a text box shared with the inter... | story | Typing code in a shared box is a new candidate action. | US-00-006 | AC-US-00-006-1, AC-US-00-006-2, AC-US-00-006-3 |
| REQ-029 | A recruiter sends an offer to a selected candidate. | story | Sending an offer is a new recruiter action. | US-01-008 | AC-US-01-008-1, AC-US-01-008-2, AC-US-01-008-3 |
| REQ-030 | A candidate accepts, declines or counters an offer on the pl... | story | Responding to an offer is a new candidate action. | US-00-010 | AC-US-00-010-1, AC-US-00-010-2, AC-US-00-010-3, AC-US-00-010-4 |
| REQ-031 | The system keeps a candidate's name, school, employer, city,... | story | Browsing anonymous profiles is how the recruiter sees candidates. | US-01-002 | AC-US-01-002-1, AC-US-01-002-2, AC-US-01-002-3 |
| REQ-032 | The system applies REQ-031 in every round until the candidat... | non-functional | Anonymity in every round is a quality carried as an AC wherever evaluators see a candidate. | US-00-004 | AC-US-00-004-4 |
| REQ-033 | The system warns a candidate, before each voice call, not to... | criterion-of US-00-007 | The warning is a step before joining a voice call. | US-00-004, US-00-007 | AC-US-00-004-7, AC-US-00-007-2 |
| REQ-034 | The system scrubs identity clues from any stored text transc... | criterion-of US-00-007 | Transcript scrubbing is a condition on what the call stores. | US-00-007 | AC-US-00-007-4 |
| REQ-036 | The system discards the audio of an agent interview after tr... | criterion-of US-00-005 | Discarding audio is a condition on what the scrubbed interview stores. | US-00-005 | AC-US-00-005-6 |
| REQ-037 | The system conducts the agent interview mainly by voice, and... | criterion-of US-00-004 | Voice-first with an in-platform editor is a condition on how the agent interview runs. | US-00-004, US-00-006 | AC-US-00-004-6, AC-US-00-006-4 |
| REQ-038 | The system shows the candidate a warning in the editor when ... | criterion-of US-00-006 | The warning is a behaviour of the editor the candidate types in. | US-00-006 | AC-US-00-006-5 |
| REQ-039 | A candidate signs up and signs in with an email and password... | story | Signing up and in is a new action every candidate takes first. | US-00-012 | AC-US-00-012-1, AC-US-00-012-2, AC-US-00-012-3 |
| REQ-040 | A user who forgot their password resets it by email. | criterion-of US-00-012 | Reset is part of owning an account. | US-00-012 | AC-US-00-012-4 |
| REQ-041 | The system groups recruiters, interviewers and an org admin ... | story | Creating and running an organization is a new org admin action. | US-01-010 | AC-US-01-010-1, AC-US-01-010-5 |
| REQ-042 | An org admin invites recruiters to the organization by email. | criterion-of US-01-010 | Inviting recruiters is how the organization gets its people. | US-01-010 | AC-US-01-010-2, AC-US-01-010-3 |
| REQ-043 | A recruiter invites interviewers to the organization by email. | story | Inviting interviewers is a new recruiter action. | US-01-011 | AC-US-01-011-1, AC-US-01-011-2 |
| REQ-044 | The system limits what each user sees by role (org admin, re... | non-functional | Visibility by role and organization is a quality carried as an AC wherever data is shown. | US-01-002, US-01-010, US-01-011 | AC-US-01-002-4, AC-US-01-010-4, AC-US-01-011-3 |
| REQ-045 | The system shows a selected candidate's identity to the recr... | criterion-of US-01-007 | Who sees the identity is a condition of the reveal. | US-01-007 | AC-US-01-007-1 |

## Gaps

| REQ | Why uncovered | Proposed action |
| --- | --- | --- |
| none | | |

## Orphan stories

| Story | Reason it exists | Action |
| --- | --- | --- |
| none | | |

## Counts

stories-coverage: 41 REQ from docs/product/PRD.md (4 withdrawn), 40 covered, 1 out of scope, 0 gaps, 23 stories, 90 AC, 0 orphans, 0 problems
Verdict: covered
