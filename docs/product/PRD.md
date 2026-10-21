# PRD: Hireva, anonymous hiring end to end

Source: pasted brief (33 lines, in conversation) plus the approved design doc (65 lines, `~/.gstack/projects/hireva/midhun-unknown-design-20261021-152535.md`); "brief" and "design doc" below name which. Normalised: 2026-10-21
Owner: unconfirmed:   Tracker epic: unconfirmed:

## 1. Problem

inferred: Hiring platforms evaluate candidates with their identity visible, so identity can influence the outcome. The brief states only that Hireva differs from "normal hiring platforms" by praising anonymity (brief, para 1); the design doc adds that identity returns once interviews start (design doc, Problem Statement). No evidence, number or complaint is in the input. See Q-007 for what "anonymous" promises.

## 2. Business objectives

| Id | Objective | Target (measurable) | Source |
| --- | --- | --- | --- |
| B1 | inferred: Candidates are evaluated without their identity influencing the outcome | target: unconfirmed | brief, para 1 ("candidate's personal details ... not considered during evaluation") |

## 3. Non-goals

- Video sharing is not included in the interview chat (design doc, Constraints).
- Screen sharing is not included; a candidate types code into a shared text box instead (design doc, Constraints).
- Voice alteration is not part of v1 (design doc, Premises 3; see REQ-028).
- The full pipeline (job postings, scheduling, proctored tests, onboarding with OCR) is not in v1 (design doc, Premises 2; see Q-010).

## 4. Personas

| Persona | Group | Who they are | What they need | Source |
| --- | --- | --- | --- | --- |
| Candidate | 00 end user | A person applying for a role | Apply and be assessed without identity being considered | brief, para 1 |
| Interviewer | 00 end user | Person assigned to interview a candidate | Interview and give feedback without seeing identity | brief, para 1 |
| Recruiter | 01 admin | Posts roles, assigns interviewers, receives feedback | Run the whole hiring flow in one place | brief, para 1 |
| Org admin | 01 admin | Runs an organization and invites its recruiters | Control who in the organization can recruit | user, 2026-10-21 |

## 5. Requirement statements

One testable statement per id. Ids are never reused or renumbered.

| Id | Statement | Persona | Source | Flags |
| --- | --- | --- | --- | --- |
| REQ-001 | withdrawn: replaced by REQ-031 (2026-10-21, Q-012). The system excludes a candidate's personal details, including gender, from evaluation. | Candidate | brief, para 1 ("personal details including gender and everything is not considered during evaluation") | withdrawn: replaced by REQ-031 |
| REQ-002 | withdrawn: replaced by REQ-032 (2026-10-21, Q-012). The system keeps a candidate's identity hidden in every round and across the entire flow. | Candidate | brief, para 1 ("during the rounds"); brief, list ("Anonymous in the entire flow") | withdrawn: replaced by REQ-032 |
| REQ-003 | The system reveals a candidate's identity only after the candidate is selected. | Candidate | brief, para 1 ("Only when the candidate is selected then only the identity is reveled") | none |
| REQ-004 | A recruiter posts a job posting on the platform. | Recruiter | brief, para 1 | none |
| REQ-005 | A candidate applies to a job posting through the platform. | Candidate | brief, para 1 | none |
| REQ-006 | A candidate updates their own portfolio on the platform. | Candidate | brief, para 1 ("candidates have to personally update their portfolio") | none |
| REQ-007 | A candidate can apply for a role when the posting is relevant. | Candidate | brief, para 1 ("if the job posting is relavant to the company then ... apply") | ambiguous: Q-003 |
| REQ-008 | A recruiter assigns a candidate to an interviewer. | Recruiter | brief, para 1 | none |
| REQ-009 | A recruiter receives the interviewer's feedback after the interview. | Recruiter | brief, para 1 | none |
| REQ-010 | The system carries the whole recruitment process on the platform. | Recruiter | brief, para 1 ("The whole recruitment should go on this platform") | none |
| REQ-011 | The system never sends a candidate to another platform during recruitment. | Candidate | brief, para 1 ("Not even once should the candidate be gone to other platform") | none |
| REQ-012 | The system includes the post-interview process on the platform. | Recruiter | brief, para 1 ("Post interview process should as be included") | ambiguous: Q-004 |
| REQ-013 | The system hosts meetings on the platform. | Candidate | brief, para 1 ("Including meetings") | ambiguous: Q-001 |
| REQ-014 | The system hosts technical rounds on the platform. | Interviewer | brief, para 1 | none |
| REQ-015 | The system hosts HR rounds on the platform. | Interviewer | brief, para 1 | none |
| REQ-016 | The system hosts written tests on the platform. | Candidate | brief, para 1 | none |
| REQ-017 | The system proctors written tests and coding tests. | Candidate | brief, list ("Hacker rank based procturing while writing the written tests or coding tests") | ambiguous: Q-002 |
| REQ-018 | The system runs an automated agentic interview. | Candidate | brief, list ("Automated agentic interview") | none |
| REQ-019 | The system provides agent personas for the interview. | Recruiter | brief, list ("Agent personas for the interview") | ambiguous: Q-005 |
| REQ-020 | The system supports a final manual interview. | Interviewer | brief, list ("Final manual interview") | ambiguous: Q-008 |
| REQ-021 | The system provides an onboarding process after a candidate is hired. | Candidate | brief, list ("Onboarding process after getting hired") | none |
| REQ-022 | The system receives documents from a hired candidate during onboarding. | Candidate | brief, list ("receiving docs") | ambiguous: Q-009 |
| REQ-023 | The system reads submitted documents with OCR. | Recruiter | brief, list ("ocr") | ambiguous: Q-009 |
| REQ-024 | The system flags identity-revealing content in a candidate's portfolio before the portfolio is made public. | Candidate | design doc, Recommended Approach ("leak linter"); conversation: "leak detector before the portfolio public" | none |
| REQ-025 | The system removes identity clues from each interview message before the message is stored or shown to a recruiter. | Candidate | design doc, Recommended Approach ("scrubbed for identity clues before storage") | none |
| REQ-026 | A recruiter scores the scrubbed interview transcript against a fixed rubric. | Recruiter | design doc, Recommended Approach | none |
| REQ-027 | A candidate types code into a text box shared with the interviewer. | Candidate | design doc, Constraints ("Code goes in a shared text box") | none |
| REQ-028 | withdrawn: The system alters the candidate's voice before it reaches the interviewer. Deferred, 2026-10-21: the user accepted gender and accent leaks for v1 ("make it such that the gender reveal and the accent reveal not such a big deal"). | Candidate | conversation, 2026-10-21 | withdrawn: deferred, see Q-007 |
| REQ-029 | A recruiter sends an offer to a selected candidate. | Recruiter | user, 2026-10-21 (Q-004: offer and negotiation in the post-interview process; Q-017) | none |
| REQ-030 | A candidate accepts, declines or counters an offer on the platform. | Candidate | user, 2026-10-21 (Q-017) | none |
| REQ-031 | The system keeps a candidate's name, school, employer, city, spouse and nickname out of everything shown to the people who evaluate the candidate; gender and accent are not covered. | Candidate | replaces REQ-001; Q-007 reading (b), Q-011 list | none |
| REQ-032 | The system applies REQ-031 in every round until the candidate is selected; speech in voice calls is not covered (Q-016). | Candidate | replaces REQ-002; brief, list ("Anonymous in the entire flow"), Q-007 | none |
| REQ-033 | The system warns a candidate, before each voice call, not to state their name, school, employer, city or other identity details. | Candidate | user, 2026-10-21 (Q-016) | none |
| REQ-034 | The system scrubs identity clues from any stored text transcript of a voice call. | Candidate | user, 2026-10-21 (Q-016) | none |
| REQ-035 | withdrawn: replaced by REQ-037 (2026-10-21, user clarified that the agent may ask for typed answers). The system conducts the agent interview by voice, with the agent speaking and listening, and without a text chat. | Candidate | user, 2026-10-21 ("there should be no text based interview") | withdrawn: replaced by REQ-037 |
| REQ-036 | The system discards the audio of an agent interview after transcription and shows a recruiter only the scrubbed transcript. | Recruiter | user, 2026-10-21 (chose "scrubbed transcript only, no audio") | none |
| REQ-037 | The system conducts the agent interview mainly by voice, and the agent can ask the candidate to type a text or code answer in an editor provided by the platform. | Candidate | replaces REQ-035; user, 2026-10-21 ("the agent can actually ask the user to input text or code in a editor provided by the platform ... Voice reply is the main thing") | none |
| REQ-038 | The system shows the candidate a warning in the editor when typed text or code contains an identity clue. | Candidate | user, 2026-10-21 ("Users should be shown a linter instead if their is a personal info that is being shared") | none |
| REQ-039 | A candidate signs up and signs in with an email and password or with a Google account. | Candidate | user, 2026-10-21 ("normal signups ... via email, pass or via gmail") | none |
| REQ-040 | A user who forgot their password resets it by email. | Candidate | user, 2026-10-21 ("a forgot password should exist as well") | none |
| REQ-041 | The system groups recruiters, interviewers and an org admin into an organization. | Org admin | user, 2026-10-21 ("An organization has different set of recruiters. Create a role for organization") | none |
| REQ-042 | An org admin invites recruiters to the organization by email. | Org admin | user, 2026-10-21 ("The organization admin can set up the recruiters and invite via emails") | none |
| REQ-043 | A recruiter invites interviewers to the organization by email. | Recruiter | user, 2026-10-21 ("The recruiters then invite the interviewers via mail") | none |
| REQ-044 | The system limits what each user sees by role (org admin, recruiter, interviewer, candidate) and by organization. | Org admin | user, 2026-10-21 (four roles listed) | none |
| REQ-045 | The system shows a selected candidate's identity to the recruiters and the interviewers of that hiring once the hiring is completed, and to no one before. | Recruiter | user, 2026-10-21 ("the identity is just not revealed until the hiring is completed for both interviewers and recruiters") | none |

## 6. Constraints

- Proctoring is "Hacker rank based" (brief, list). Whether this means integrating HackerRank is open (Q-002).
- Hobby project, solo builder, v1 in 2 to 3 weekends (design doc, Constraints).
- No video and no screen sharing (design doc, Constraints).
- Gender and accent leaks are accepted for v1; writing-style and code-style leaks are also accepted (design doc, Constraints; Q-007).
- Voice calls are part of meetings and the final interview, and voice leaks are accepted (Q-001, Q-008, Q-016).
- Tech stack is undecided (design doc, Open Questions).

## 7. Open questions

33 entries in docs/product/questions.md: 0 open, 0 need your confirmation. All confirmed on 2026-10-21.

## 8. Could not extract

- Problem evidence: not in the input; the owner can supply a complaint, number or quote.
- Business objective targets: not in the input as a number and date; the design doc has a demo success criterion ("two people, one link, one outsider tries it", see Q-015). The owner can supply a target.
- Owner and tracker epic: not in the input; the owner can supply them.
- Budget, launch date, user count: not in the input.

## 9. Glossary

| Term | Meaning | Source |
| --- | --- | --- |
| Reveal | The step where a selected candidate's identity becomes visible | brief, para 1 |
| Agent persona | A configured style or role for the automated interviewer | brief, list |
| Proctoring | Supervision of a candidate while taking a written or coding test | brief, list |
| Leak detector / leak linter | A check that finds identity clues in text before it is published or shown | design doc |
| Scrubbed transcript | An interview transcript with identity clues removed | design doc |
