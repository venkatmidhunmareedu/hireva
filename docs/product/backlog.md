# Backlog: Hireva

PRD: docs/product/PRD.md   Questions: docs/product/questions.md   Built: 2026-10-21

## Story index

| Story | Epic | Title | Persona | Priority | Points | Covers | Depends on |
| --- | --- | --- | --- | --- | --- | --- | --- |
| US-00-001 | EP-01 | Maintain my portfolio | Candidate | Must | 3 | REQ-006 | none |
| US-00-002 | EP-01 | Check my portfolio for identity leaks | Candidate | Must | 5 | REQ-024 | US-00-001 |
| US-00-003 | EP-02 | Apply to a job posting | Candidate | Must | 3 | REQ-005, REQ-007 | US-01-001, US-00-002 |
| US-00-004 | EP-03 | Take the automated agent interview | Candidate | Must | 8 | REQ-010, REQ-011, REQ-018, REQ-032, REQ-033, REQ-037 | US-00-005 |
| US-00-005 | EP-03 | Scrub identity clues from the spoken interview | Candidate | Must | 5 | REQ-025, REQ-036 | none |
| US-00-006 | EP-03 | Type text or code in the platform editor | Candidate | Must | 3 | REQ-027, REQ-037, REQ-038 | US-00-004 |
| US-00-007 | EP-03 | Join a voice call with chat | Candidate | Should | 8 | REQ-013, REQ-020, REQ-033, REQ-034 | US-01-003, US-00-006 |
| US-00-008 | EP-03 | Take a written test | Candidate | Could | 3 | REQ-016 | US-01-001 |
| US-00-009 | EP-04 | Submit interview feedback | Interviewer | Should | 2 | REQ-009 | US-01-003 |
| US-00-010 | EP-05 | Respond to an offer | Candidate | Could | 3 | REQ-030 | US-01-008 |
| US-00-011 | EP-05 | Submit onboarding documents | Candidate | Could | 5 | REQ-022, REQ-023 | US-00-010, US-01-009 |
| US-01-001 | EP-02 | Post a job with its persona and rubric | Recruiter | Must | 8 | REQ-004, REQ-019, REQ-026 | none |
| US-01-002 | EP-04 | Browse candidates without seeing who they are | Recruiter | Must | 3 | REQ-031, REQ-044 | US-00-002, US-00-003 |
| US-01-003 | EP-04 | Assign a candidate to an interviewer | Recruiter | Should | 3 | REQ-008, REQ-014, REQ-015 | US-01-002 |
| US-01-004 | EP-04 | Score a scrubbed interview transcript | Recruiter | Must | 3 | REQ-026 | US-00-004, US-00-005, US-01-001 |
| US-01-005 | EP-04 | Review interviewer feedback | Recruiter | Should | 1 | REQ-009 | US-00-009 |
| US-01-006 | EP-04 | Flag a missed identity clue | Recruiter | Should | 2 | REQ-025, REQ-026 | US-01-004 |
| US-01-007 | EP-05 | Select a candidate and reveal their identity | Recruiter | Must | 3 | REQ-003, REQ-012, REQ-045 | US-01-004 |
| US-01-008 | EP-05 | Send an offer | Recruiter | Could | 2 | REQ-012, REQ-029 | US-01-007 |
| US-01-009 | EP-05 | Set the onboarding documents | Recruiter | Could | 2 | REQ-021 | US-00-010 |
| US-00-012 | EP-01 | Sign up, sign in and reset a password | Candidate | Must | 3 | REQ-039, REQ-040 | none |
| US-01-010 | EP-06 | Create an organization and invite recruiters | Org admin | Must | 5 | REQ-041, REQ-042, REQ-044 | US-00-012 |
| US-01-011 | EP-06 | Invite interviewers | Recruiter | Should | 3 | REQ-043, REQ-044 | US-01-010 |

## Hours by discipline

tasks: not written (stories only)

## EP-01 Present myself without my identity

Goal: a candidate has an account and a portfolio that shows their work and no identity clues
Covers: REQ-006, REQ-024, REQ-039, REQ-040

### US-00-001 Maintain my portfolio

Epic: EP-01   Priority: Must   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-006   Judgement: story

**Narrative.** As a Candidate, I want to create and edit my own portfolio, so that I can present my work to recruiters.

**Why it matters.** B1: a portfolio is the only thing recruiters see of a candidate, so nothing else can be judged until candidates can write one.

**From the PRD.**
- REQ-006: "A candidate updates their own portfolio on the platform."

**Preconditions.**
- The candidate has an account (Q-023).

**Acceptance criteria.**

- AC-US-00-001-1. Given a signed-in candidate, when they enter work history, skills and projects and save, then the portfolio shows the saved content after a page reload.
  Covers: REQ-006
- AC-US-00-001-2. Given an existing portfolio, when the candidate edits an entry and saves, then the new content replaces the old and no other candidate's portfolio changes.
  Covers: REQ-006

**Not in this story.**
- Checking the portfolio for identity clues (US-00-002)
- Making the portfolio visible to recruiters (US-00-002)
- Sign-up and sign-in (US-00-012)

**Depends on.**
- none

**Assumptions.**
- Only the candidate edits their own portfolio (brief: "candidates have to personally update their portfolio").

### US-00-002 Check my portfolio for identity leaks

Epic: EP-01   Priority: Must   Points: 5
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-024   Judgement: story

**Narrative.** As a Candidate, I want to see which passages in my portfolio reveal who I am and redact them, so that my identity stays hidden when recruiters read it.

**Why it matters.** B1: the portfolio is the first thing evaluators read, so identity left in it defeats anonymity before any interview starts.

**From the PRD.**
- REQ-024: "The system flags identity-revealing content in a candidate's portfolio before the portfolio is made public."

**Preconditions.**
- The candidate has a portfolio (US-00-001).

**Acceptance criteria.**

- AC-US-00-002-1. Given a portfolio containing a name, school, employer, city, spouse or nickname, when the candidate runs the leak check, then each such passage is highlighted with its category.
  Covers: REQ-024
- AC-US-00-002-2. Given a highlighted passage, when the candidate chooses redact, then the passage is replaced by a neutral placeholder and the highlight clears.
  Covers: REQ-024
- AC-US-00-002-3. Given a highlighted passage the candidate says is not identifying, when they mark it so, then the highlight clears and the passage stays.
  Covers: REQ-024
- AC-US-00-002-4. Given any unresolved highlight, when the candidate tries to make the portfolio visible to recruiters, then it stays hidden and the unresolved passages are listed.
  Covers: REQ-024
- AC-US-00-002-5. Given a portfolio with no matches, when the check runs, then the candidate is told nothing was found and that the check cannot catch every clue.
  Covers: REQ-024

**Not in this story.**
- Scrubbing interview messages (US-00-005)
- Clues outside the Q-011 list, such as photo metadata or writing style (Q-007, Q-011)

**Depends on.**
- US-00-001: the portfolio the check reads

**Assumptions.**
- Marking a passage "not identifying" is allowed because the candidate owns the content (inferred:).

### US-00-012 Sign up, sign in and reset a password

Epic: EP-01   Priority: Must   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-039, REQ-040   Judgement: story

**Narrative.** As a Candidate, I want to create an account with my email and password or my Google account, sign in, and reset a forgotten password, so that I can use Hireva while my name stays hidden from the people who evaluate me.

**Why it matters.** B1: the account is where identity enters the system, so it must be stored apart from everything evaluators read.

**From the PRD.**
- REQ-039: "A candidate signs up and signs in with an email and password or with a Google account."
- REQ-040: "A user who forgot their password resets it by email."

**Preconditions.**
- none

**Acceptance criteria.**

- AC-US-00-012-1. Given a visitor, when they sign up with a name, email and password, then an account exists, the name is stored in the identity schema, and they are signed in.
  Covers: REQ-039
- AC-US-00-012-2. Given a visitor, when they choose Google sign-in and approve, then an account exists, the name from Google is stored in the identity schema, and they are signed in.
  Covers: REQ-039
- AC-US-00-012-3. Given an account, when the user signs in with the right credentials, then they reach the page for their role, and with wrong credentials they see a message and stay signed out.
  Covers: REQ-039
- AC-US-00-012-4. Given a user who forgot their password, when they ask for a reset with their email, then an email with a reset link is sent and the new password works once they set it.
  Covers: REQ-040

**Not in this story.**
- Organization and recruiter accounts (US-01-010)
- Interviewer accounts by invitation (US-01-011)
- Revealing the name to anyone (US-01-007)

**Depends on.**
- none

**Assumptions.**
- Supabase Auth provides email and password, Google sign-in and reset (ADR-0006; assumption until built).
- The name is collected at sign-up and written to the identity schema (inferred:, Q-031).

## EP-02 Open and apply to roles

Goal: a recruiter posts roles and a candidate applies to any of them
Covers: REQ-004, REQ-005, REQ-007, REQ-019, REQ-026

### US-00-003 Apply to a job posting

Epic: EP-02   Priority: Must   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-005, REQ-007   Judgement: story

**Narrative.** As a Candidate, I want to apply to a job posting through the platform, so that I can be considered for the role without leaving it.

**Why it matters.** B1: applying is where a candidate enters the flow; recruiters receive the application without identity from the start.

**From the PRD.**
- REQ-005: "A candidate applies to a job posting through the platform."
- REQ-007: "A candidate can apply for a role when the posting is relevant."

**Preconditions.**
- A published portfolio (US-00-002) and an open job posting (US-01-001).

**Acceptance criteria.**

- AC-US-00-003-1. Given an open posting and a published portfolio, when the candidate applies, then the application appears in the recruiter's list.
  Covers: REQ-005
- AC-US-00-003-2. Given any open posting, whether or not it matches the portfolio, when the candidate chooses apply, then the application is accepted (Q-003).
  Covers: REQ-007
- AC-US-00-003-3. Given a candidate who already applied to a posting, when they apply again, then the second application is refused with a message that they already applied.
  Covers: REQ-005
- AC-US-00-003-4. Given a closed posting, when the candidate views postings, then it is not offered for application.
  Covers: REQ-005
- AC-US-00-003-5. Given a candidate who applies to an open posting, when the application is saved, then an interview is created for it and its link is shown to the candidate.
  Covers: REQ-005

**Not in this story.**
- How the recruiter sees the application (US-01-002)
- Any relevance gate or approval of applications (Q-003)

**Depends on.**
- US-01-001: the posting applied to
- US-00-002: the published portfolio

**Assumptions.**
- "Relevant" is read as: the candidate decides, any open posting (Q-003).

### US-01-001 Post a job with its persona and rubric

Epic: EP-02   Priority: Must   Points: 8
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-004, REQ-019, REQ-026   Judgement: story

**Narrative.** As a Recruiter, I want to post a job and set the agent persona and scoring rubric for it, so that candidates can apply and every one is interviewed and scored the same way.

**Why it matters.** B1: postings start every flow, and the persona and rubric set how the anonymous interview is run and judged.

**From the PRD.**
- REQ-004: "A recruiter posts a job posting on the platform."
- REQ-019: "The system provides agent personas for the interview."
- REQ-026: "A recruiter scores the scrubbed interview transcript against a fixed rubric."

**Preconditions.**
- The recruiter has an account (Q-023).

**Acceptance criteria.**

- AC-US-01-001-1. Given a recruiter, when they enter a title and description and publish, then the posting appears as open to candidates.
  Covers: REQ-004
- AC-US-01-001-2. Given an open posting, when the recruiter closes it, then candidates can no longer apply.
  Covers: REQ-004
- AC-US-01-001-3. Given a posting description, when the recruiter asks for personas, then the AI proposes a set of agent persona presets for that posting.
  Covers: REQ-019
- AC-US-01-001-4. Given proposed presets, when the recruiter accepts, edits, rejects or regenerates one, then the posting uses the accepted persona and regenerating replaces the proposals.
  Covers: REQ-019
- AC-US-01-001-5. Given a posting description, when the recruiter asks for a rubric, then the AI proposes must-have and nice-to-have items.
  Covers: REQ-026
- AC-US-01-001-6. Given proposed rubric items, when the recruiter accepts, edits, adds or removes items and publishes, then the rubric is fixed for that posting and used for every transcript scored against it.
  Covers: REQ-026

**Not in this story.**
- Applying (US-00-003)
- Written test content (US-00-008)
- Changing the rubric after interviews have started (not in the PRD)

**Depends on.**
- none

**Assumptions.**
- The recruiter picks the persona per posting (Q-005); the AI proposes and the recruiter decides (Q-025).
- The rubric is set per posting, with AI-proposed must-have and nice-to-have items (Q-020).

## EP-03 Be interviewed without revealing who I am

Goal: a candidate completes agent, voice and written rounds with identity kept out
Covers: REQ-010, REQ-011, REQ-013, REQ-016, REQ-018, REQ-020, REQ-025, REQ-027, REQ-032, REQ-033, REQ-034, REQ-036, REQ-037, REQ-038

### US-00-004 Take the automated agent interview

Epic: EP-03   Priority: Must   Points: 8
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-010, REQ-011, REQ-018, REQ-032, REQ-033, REQ-037   Judgement: story

**Narrative.** As a Candidate, I want to be interviewed by an agent that speaks and listens, and asks me to type when it needs text or code, so that I can show my skills without revealing who I am.

**Why it matters.** B1: the agent interviewer is anonymous by construction, which is how anonymity survives the interview round.

**From the PRD.**
- REQ-010: "The system carries the whole recruitment process on the platform."
- REQ-011: "The system never sends a candidate to another platform during recruitment."
- REQ-018: "The system runs an automated agentic interview."
- REQ-032: "The system applies REQ-031 in every round until the candidate is selected; speech in voice calls is not covered (Q-016)."
- REQ-033: "The system warns a candidate, before each voice call, not to state their name, school, employer, city or other identity details."
- REQ-037: "The system conducts the agent interview mainly by voice, and the agent can ask the candidate to type a text or code answer in an editor provided by the platform."

**Preconditions.**
- The candidate has an interview link, from an assignment (US-01-003) or a direct link in v1, and a working microphone and speakers.

**Acceptance criteria.**

- AC-US-00-004-1. Given an interview link, when the candidate opens it, then an agent interviewer greets them by voice using the persona set for the job (or the default persona).
  Covers: REQ-018
- AC-US-00-004-2. Given the interview in progress, when the candidate speaks an answer, then the agent replies aloud with a follow-up question that refers to the answer.
  Covers: REQ-018
- AC-US-00-004-3. Given a finished interview, when it ends, then the scrubbed transcript is stored for scoring and the candidate sees a confirmation.
  Covers: REQ-018
- AC-US-00-004-4. Given a stored interview, when a recruiter opens it, then it shows only the candidate's application number and the scrubbed transcript, with no name, school, employer, city, spouse or nickname.
  Covers: REQ-032
- AC-US-00-004-5. Given the whole interview from start to finish, when the candidate completes it, then no step sends them to a page outside the platform.
  Covers: REQ-010, REQ-011
- AC-US-00-004-6. Given the interview in progress, when the candidate answers, then answers are mainly spoken, there is no free chat box, and typing happens only in the platform editor when the agent asks for it (US-00-006).
  Covers: REQ-037
- AC-US-00-004-7. Given a candidate about to start the interview, when the interview page opens, then a warning not to say or type their name, school, employer, city or other identity details is shown and must be acknowledged before starting.
  Covers: REQ-033

**Not in this story.**
- Scrubbing rules (US-00-005)
- Scoring (US-01-004)
- Voice calls with a human interviewer (US-00-007)
- Real candidate data (Q-014: fake data only in v1)
- Real-time speed of the speech models on the free VM (ADR-0009 revisit trigger)

**Depends on.**
- US-00-005: the scrubber the agent reads through

**Assumptions.**
- Scrubbed spoken transcripts, not the original, are sent to the agent's model (Q-024); typed editor answers go as typed (Q-027).
- Speech-to-text (Moonshine) and text-to-speech (Kokoro) run self-hosted on the Oracle VM (ADR-0009).
- The persona comes from the posting; a default applies when none was accepted (Q-025).

### US-00-005 Scrub identity clues from the spoken interview

Epic: EP-03   Priority: Must   Points: 5
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-025, REQ-036   Judgement: story

**Narrative.** As a Candidate, I want to have identity clues removed from what I say in the interview, so that recruiters see my answers but not who I am.

**Why it matters.** B1: this is the mechanism that keeps the interview round anonymous; without it the agent interview is just a chat.

**From the PRD.**
- REQ-025: "The system removes identity clues from each interview message before the message is stored or shown to a recruiter."
- REQ-036: "The system discards the audio of an agent interview after transcription and shows a recruiter only the scrubbed transcript."

**Preconditions.**
- An interview is in progress (US-00-004).

**Acceptance criteria.**

- AC-US-00-005-1. Given a spoken answer whose transcript contains a name, school, employer, city, spouse or nickname, when it is transcribed, then the stored transcript and anything shown to a recruiter has that text replaced with a category placeholder.
  Covers: REQ-025
- AC-US-00-005-2. Given a spoken answer with none of those clues, when it is transcribed, then the transcript is stored unchanged.
  Covers: REQ-025
- AC-US-00-005-3. Given a scrubbed transcript, when the candidate views it afterwards, then each turn lists which categories were replaced, not the removed text.
  Covers: REQ-025
- AC-US-00-005-4. Given a transcribed answer, when the agent generates its reply, then the model input contains the scrubbed transcript, not the original (Q-024).
  Covers: REQ-025
- AC-US-00-005-5. Given the name-detection pass fails, when an answer is transcribed, then it is neither stored nor shown and the agent asks the candidate to repeat it; given the model pass fails after the agent replied, then the reply is kept marked orphaned, the candidate's turn is discarded and the agent asks again, or the interview pauses if OpenRouter is down.
  Covers: REQ-025
- AC-US-00-005-6. Given a finished interview, when the transcript is stored, then the audio is discarded and a recruiter is shown only the scrubbed transcript.
  Covers: REQ-036

**Not in this story.**
- Speech in voice calls with a human interviewer (US-00-007, Q-016)
- Typed text and code in the editor (not scrubbed; US-00-006 shows a linter, Q-027)
- Finding clues the scrubber missed (US-01-006)
- Gender and accent (Q-007)

**Depends on.**
- none

**Assumptions.**
- Removed text is not kept, so the candidate sees categories only (inferred:, to avoid storing the clue).
- Test set is the ten leaky answers from the design doc assignment.

### US-00-006 Type text or code in the platform editor

Epic: EP-03   Priority: Must   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-027, REQ-037, REQ-038   Judgement: story

**Narrative.** As a Candidate, I want to type a text or code answer into an editor when the agent asks for one, so that I can answer written and technical questions without sharing my screen.

**Why it matters.** B1: a shared box replaces screen sharing, which would reveal identity, so technical answers stay anonymous.

**From the PRD.**
- REQ-027: "A candidate types code into a text box shared with the interviewer."
- REQ-037: "The system conducts the agent interview mainly by voice, and the agent can ask the candidate to type a text or code answer in an editor provided by the platform."
- REQ-038: "The system shows the candidate a warning in the editor when typed text or code contains an identity clue."

**Preconditions.**
- An interview is in progress (US-00-004).

**Acceptance criteria.**

- AC-US-00-006-1. Given an open interview, when the candidate types code in the shared box, then the interviewer, human or agent, receives the text without a reload.
  Covers: REQ-027
- AC-US-00-006-2. Given the shared box, when a human interviewer views it, then they can read it and cannot edit the candidate's text.
  Covers: REQ-027
- AC-US-00-006-3. Given a finished interview, when it is stored, then the box content is kept with the transcript.
  Covers: REQ-027
- AC-US-00-006-4. Given the agent asks for a written answer, when the candidate types it in the editor and submits, then the answer is sent to the agent as typed and the interview continues (Q-027: typed content is not scrubbed).
  Covers: REQ-037
- AC-US-00-006-5. Given text or code typed in the editor that contains a name, school, employer, city, spouse or nickname, when it is typed, then the editor flags it with its category, and the candidate can edit it or submit it as typed (Q-028).
  Covers: REQ-038

**Not in this story.**
- Running code or tests (not in the PRD)
- Screen sharing and video (PRD non-goal)
- Scrubbing typed text and code (Q-027: not scrubbed; the linter warns instead)

**Depends on.**
- US-00-004: the interview it sits in

**Assumptions.**
- The interviewer has read-only access (inferred:).

### US-00-007 Join a voice call with chat

Epic: EP-03   Priority: Should   Points: 8
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-013, REQ-020, REQ-033, REQ-034   Judgement: story

**Narrative.** As a Candidate, I want to join a voice call that also has text chat and the shared code box, so that I can have a live conversation, including the final interview with a person.

**Why it matters.** B1: live rounds are where identity usually returns; the call keeps video out and warns the candidate before speaking.

**From the PRD.**
- REQ-013: "The system hosts meetings on the platform."
- REQ-020: "The system supports a final manual interview."
- REQ-033: "The system warns a candidate, before each voice call, not to state their name, school, employer, city or other identity details."
- REQ-034: "The system scrubs identity clues from any stored text transcript of a voice call."

**Preconditions.**
- A call is scheduled by assignment (US-01-003).

**Acceptance criteria.**

- AC-US-00-007-1. Given a scheduled call, when the candidate and the interviewer join, then they can talk by voice and use text chat and the shared code box, with no video.
  Covers: REQ-013
- AC-US-00-007-2. Given a candidate about to join, when the call page opens, then a warning not to state their name, school, employer, city or other identity details is shown and must be acknowledged before joining.
  Covers: REQ-033
- AC-US-00-007-3. Given the call, when the interviewer views the participant list, then the candidate appears as their application number.
  Covers: REQ-013
- AC-US-00-007-4. Given a call that ends, when it is stored, then the audio is transcribed to text, listed clues in the transcript and the chat are replaced with placeholders, and no audio and no unscrubbed transcript is kept.
  Covers: REQ-034
- AC-US-00-007-5. Given a round marked final by the recruiter, when it is held, then it is the same call, live speech is not altered, and the interviewer is asked for feedback afterwards.
  Covers: REQ-020

**Not in this story.**
- Video and screen sharing (PRD non-goal)
- Voice alteration (REQ-028 withdrawn, Q-007)
- Keeping call audio or the unscrubbed transcript (Q-019: both are discarded)

**Depends on.**
- US-01-003: the assignment that schedules the call
- US-00-006: the shared box

**Assumptions.**
- Audio is discarded once transcribed (inferred:, Q-019).

### US-00-008 Take a written test

Epic: EP-03   Priority: Could   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-016   Judgement: story

**Narrative.** As a Candidate, I want to take a written test on the platform, so that my written answers can be assessed anonymously.

**Why it matters.** B1: written tests are one more round where identity must stay hidden.

**From the PRD.**
- REQ-016: "The system hosts written tests on the platform."

**Preconditions.**
- The recruiter attached a test to the posting (US-01-001).

**Acceptance criteria.**

- AC-US-00-008-1. Given an assigned written test, when the candidate opens it, then the questions are shown on the platform.
  Covers: REQ-016
- AC-US-00-008-2. Given a test in progress, when the candidate submits answers, then they are stored under the application number.
  Covers: REQ-016
- AC-US-00-008-3. Given stored answers, when the scorer opens them, then no name, school, employer, city, spouse or nickname is shown.
  Covers: REQ-016

**Not in this story.**
- Proctoring (REQ-017 is out of scope for v1, Q-002)
- Coding-test runner (not in the PRD)

**Depends on.**
- US-01-001: attaches the test to the posting

**Assumptions.**
- Test questions are text entered by the recruiter (inferred:).

## EP-04 Evaluate candidates on their work

Goal: evaluators score and give feedback on anonymous candidates
Covers: REQ-008, REQ-009, REQ-014, REQ-015, REQ-025, REQ-026, REQ-031, REQ-044

### US-00-009 Submit interview feedback

Epic: EP-04   Priority: Should   Points: 2
Persona: Interviewer, group 00   Ticket: unassigned
Covers: REQ-009   Judgement: split from REQ-009

**Narrative.** As a Interviewer, I want to submit feedback after an interview, so that the recruiter can decide using my view.

**Why it matters.** B1: feedback is how the interviewer's view enters the decision without the interviewer seeing who the candidate is.

**From the PRD.**
- REQ-009: "A recruiter receives the interviewer's feedback after the interview."

**Preconditions.**
- The interviewer was assigned the candidate (US-01-003) and the interview has finished.

**Acceptance criteria.**

- AC-US-00-009-1. Given a finished interview, when the interviewer submits ratings and comments, then they are saved with the candidate's record.
  Covers: REQ-009
- AC-US-00-009-2. Given the feedback form, when the interviewer opens it, then the candidate appears only by application number.
  Covers: REQ-009

**Not in this story.**
- The recruiter reading the feedback (US-01-005)
- Scoring a transcript (US-01-004)

**Depends on.**
- US-01-003: the assignment

**Assumptions.**
- The interviewer is an end user, group 00 (inferred:).

### US-01-002 Browse candidates without seeing who they are

Epic: EP-04   Priority: Must   Points: 3
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-031, REQ-044   Judgement: story

**Narrative.** As a Recruiter, I want to see applicants as anonymous profiles, so that I judge them on their work, not their identity.

**Why it matters.** B1: this is the screen where the anonymity promise is kept or broken for the person making the decision.

**From the PRD.**
- REQ-031: "The system keeps a candidate's name, school, employer, city, spouse and nickname out of everything shown to the people who evaluate the candidate; gender and accent are not covered."
- REQ-044: "The system limits what each user sees by role (org admin, recruiter, interviewer, candidate) and by organization."

**Preconditions.**
- Applications exist (US-00-003).

**Acceptance criteria.**

- AC-US-01-002-1. Given applications, when the recruiter opens the list, then each candidate appears by application number with portfolio content only.
  Covers: REQ-031
- AC-US-01-002-2. Given a candidate's portfolio, when the recruiter opens it, then it shows only content that passed the leak check and no name, school, employer, city, spouse or nickname.
  Covers: REQ-031
- AC-US-01-002-3. Given the list, when the recruiter searches for a candidate's name, then no candidate is found.
  Covers: REQ-031
- AC-US-01-002-4. Given a recruiter of one organization, when they open the applicant list, then applications to other organizations' postings do not appear.
  Covers: REQ-044

**Not in this story.**
- Gender and accent (not covered, Q-007)
- Revealing identity after selection (US-01-007)

**Depends on.**
- US-00-002: the portfolios shown
- US-00-003: the applications

**Assumptions.**
- The alias is the candidate's application number, not a random id (Q-022).

### US-01-003 Assign a candidate to an interviewer

Epic: EP-04   Priority: Should   Points: 3
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-008, REQ-014, REQ-015   Judgement: story

**Narrative.** As a Recruiter, I want to assign a candidate to an interviewer for a technical or HR round, so that each round gets the right person.

**Why it matters.** B1: assignment is how a candidate reaches a human interviewer while staying anonymous to them.

**From the PRD.**
- REQ-008: "A recruiter assigns a candidate to an interviewer."
- REQ-014: "The system hosts technical rounds on the platform."
- REQ-015: "The system hosts HR rounds on the platform."

**Preconditions.**
- An application exists (US-00-003) and the interviewer has an account (Q-023).

**Acceptance criteria.**

- AC-US-01-003-1. Given an application, when the recruiter picks an interviewer and a round type, then the assignment is saved and the interviewer is notified.
  Covers: REQ-008
- AC-US-01-003-2. Given a technical round, when the interview opens, then the shared code box is available.
  Covers: REQ-014
- AC-US-01-003-3. Given an HR round, when the interview opens, then it runs without the shared code box.
  Covers: REQ-015
- AC-US-01-003-4. Given an assignment, when the interviewer opens it, then they see the candidate's application number and anonymous portfolio only.
  Covers: REQ-008

**Not in this story.**
- Scheduling times (not in the PRD)
- The call itself (US-00-007)

**Depends on.**
- US-01-002: the anonymous profile the interviewer sees

**Assumptions.**
- Round types are technical and HR (REQ-014, REQ-015).

### US-01-004 Score a scrubbed interview transcript

Epic: EP-04   Priority: Must   Points: 3
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-026   Judgement: story

**Narrative.** As a Recruiter, I want to score a scrubbed transcript against a fixed rubric, so that I decide on the answers, not on who gave them.

**Why it matters.** B1: scoring is the decision step; making it use only scrubbed text is what turns anonymity into an outcome.

**From the PRD.**
- REQ-026: "A recruiter scores the scrubbed interview transcript against a fixed rubric."

**Preconditions.**
- A finished agent interview (US-00-004).

**Acceptance criteria.**

- AC-US-01-004-1. Given a finished agent interview, when the recruiter opens it, then they see the scrubbed transcript and the posting's rubric (Q-020).
  Covers: REQ-026
- AC-US-01-004-2. Given the transcript, when the recruiter scores each rubric item and submits, then the scores are saved with the transcript.
  Covers: REQ-026

**Not in this story.**
- Proposing and editing the rubric (US-01-001)
- Feedback from a human interviewer (US-01-005)

**Depends on.**
- US-00-004: the interview scored
- US-00-005: the scrubbed text
- US-01-001: the posting's rubric

**Assumptions.**
- A second person may score instead of the recruiter (Q-015); both are recruiter-side users.

### US-01-005 Review interviewer feedback

Epic: EP-04   Priority: Should   Points: 1
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-009   Judgement: split from REQ-009

**Narrative.** As a Recruiter, I want to read the feedback an interviewer submitted, so that I can decide who to select.

**Why it matters.** B1: feedback is the human input to the selection decision, shown without identity.

**From the PRD.**
- REQ-009: "A recruiter receives the interviewer's feedback after the interview."

**Preconditions.**
- The interviewer submitted feedback (US-00-009).

**Acceptance criteria.**

- AC-US-01-005-1. Given submitted feedback, when the recruiter opens the candidate's record, then the feedback is shown under the application number.
  Covers: REQ-009
- AC-US-01-005-2. Given an interview with no feedback yet, when the recruiter opens the record, then it shows that feedback is awaited.
  Covers: REQ-009

**Not in this story.**
- Submitting feedback (US-00-009)
- Selecting the candidate (US-01-007)

**Depends on.**
- US-00-009: the feedback

**Assumptions.**
- none

### US-01-006 Flag a missed identity clue

Epic: EP-04   Priority: Should   Points: 2
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-025, REQ-026   Judgement: story

**Narrative.** As a Recruiter, I want to flag a passage that still reveals identity, so that a leak the scrubber missed does not decide anyone's score.

**Why it matters.** B1: the scrubber will miss some clues, and this keeps a miss from silently tilting an anonymous decision.

**From the PRD.**
- REQ-025: "The system removes identity clues from each interview message before the message is stored or shown to a recruiter."
- REQ-026: "A recruiter scores the scrubbed interview transcript against a fixed rubric."

**Preconditions.**
- The recruiter is reading a scrubbed transcript (US-01-004).

**Acceptance criteria.**

- AC-US-01-006-1. Given a scrubbed transcript, when the recruiter flags a passage as revealing identity, then the score for that transcript is marked void.
  Covers: REQ-025
- AC-US-01-006-2. Given a flagged passage, when anyone else opens the transcript, then the passage is replaced by a placeholder.
  Covers: REQ-025
- AC-US-01-006-3. Given a transcript the recruiter flagged for a missed clue, when the scores are listed, then that score is marked void and left out.
  Covers: REQ-026
- AC-US-01-006-4. Given a flag, when it is saved, then it is recorded with the passage and the time for the owner to review.
  Covers: REQ-025

**Not in this story.**
- Improving the scrubber from flags (not in the PRD)

**Depends on.**
- US-01-004: the scoring it voids

**Assumptions.**
- The flag is how a miss is found and reported (Q-018, Q-011, Q-015).

## EP-05 Select, reveal and hire

Goal: a selected candidate is revealed, gets an offer and completes onboarding
Covers: REQ-003, REQ-012, REQ-021, REQ-022, REQ-023, REQ-029, REQ-030, REQ-045

### US-00-010 Respond to an offer

Epic: EP-05   Priority: Could   Points: 3
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-030   Judgement: story

**Narrative.** As a Candidate, I want to accept, decline or counter an offer, so that I can decide whether to take the job and on what terms.

**Why it matters.** B1: an offer is the last step of the flow; keeping it on the platform means candidates are never sent elsewhere.

**From the PRD.**
- REQ-030: "A candidate accepts, declines or counters an offer on the platform."

**Preconditions.**
- The recruiter sent an offer (US-01-008).

**Acceptance criteria.**

- AC-US-00-010-1. Given an offer, when the candidate accepts, then the offer shows accepted and the recruiter is notified.
  Covers: REQ-030
- AC-US-00-010-2. Given an offer, when the candidate declines, then the offer shows declined and the recruiter is notified.
  Covers: REQ-030
- AC-US-00-010-3. Given an offer, when the candidate counters with a message and proposed terms, then the offer shows countered and the recruiter sees the counter.
  Covers: REQ-030
- AC-US-00-010-4. Given an accepted or declined offer, when the candidate opens it, then no further response can be made.
  Covers: REQ-030

**Not in this story.**
- Sending the offer (US-01-008)
- Onboarding (US-00-011)

**Depends on.**
- US-01-008: the offer

**Assumptions.**
- A counter carries a message and proposed terms, any number of rounds (Q-021).

### US-00-011 Submit onboarding documents

Epic: EP-05   Priority: Could   Points: 5
Persona: Candidate, group 00   Ticket: unassigned
Covers: REQ-022, REQ-023   Judgement: story

**Narrative.** As a Candidate, I want to upload the documents my employer asks for, so that I can finish joining without leaving the platform.

**Why it matters.** B1: onboarding is part of the whole flow the brief wants on one platform.

**From the PRD.**
- REQ-022: "The system receives documents from a hired candidate during onboarding."
- REQ-023: "The system reads submitted documents with OCR."

**Preconditions.**
- The candidate accepted an offer (US-00-010) and the recruiter listed the documents (US-01-009).

**Acceptance criteria.**

- AC-US-00-011-1. Given a list of required documents, when the candidate uploads one, then it is stored against that requirement.
  Covers: REQ-022
- AC-US-00-011-2. Given an uploaded document, when it is processed, then the text fields OCR extracts are shown to the recruiter to confirm.
  Covers: REQ-023
- AC-US-00-011-3. Given a file the OCR cannot read, when it is processed, then the candidate sees the message "Cannot read this file".
  Covers: REQ-023
- AC-US-00-011-4. Given missing required documents, when the candidate opens onboarding, then the missing ones are listed.
  Covers: REQ-022

**Not in this story.**
- Choosing which documents are required (US-01-009, Q-009)
- Which OCR fields to extract (Q-009)

**Depends on.**
- US-00-010: accepted offer
- US-01-009: the document list

**Assumptions.**
- The OCR runs on the documents the employer specifies, no fixed field list (Q-009).

### US-01-007 Select a candidate and reveal their identity

Epic: EP-05   Priority: Must   Points: 3
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-003, REQ-012, REQ-045   Judgement: split from REQ-012

**Narrative.** As a Recruiter, I want to mark a candidate selected and see who they are, so that I can move to the offer and onboarding.

**Why it matters.** B1: the reveal is the end of the anonymous phase; showing identity only now is the whole promise.

**From the PRD.**
- REQ-003: "The system reveals a candidate's identity only after the candidate is selected."
- REQ-012: "The system includes the post-interview process on the platform."
- REQ-045: "The system shows a selected candidate's identity to the recruiters and the interviewers of that hiring once the hiring is completed, and to no one before."

**Preconditions.**
- A scored candidate (US-01-004).

**Acceptance criteria.**

- AC-US-01-007-1. Given a candidate who completed the rounds, when the recruiter marks them selected, then the candidate's name and contact details become visible to the recruiters of the organization and the interviewers assigned to that candidate, and to no one else.
  Covers: REQ-003, REQ-045
- AC-US-01-007-2. Given a candidate who is not selected, when anyone opens their record, then no name or contact detail is shown anywhere.
  Covers: REQ-003
- AC-US-01-007-3. Given a selected candidate, when the recruiter opens the record, then the offer and onboarding steps are available.
  Covers: REQ-012

**Not in this story.**
- Sending the offer (US-01-008)
- Identity before the hiring is completed (REQ-003)

**Depends on.**
- US-01-004: the scores behind the decision

**Assumptions.**
- Identity details are held apart from evaluator screens until now (Q-023).
- The identity is the name entered at sign-up (US-00-012, Q-031).

### US-01-008 Send an offer

Epic: EP-05   Priority: Could   Points: 2
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-012, REQ-029   Judgement: story

**Narrative.** As a Recruiter, I want to send an offer to a selected candidate, so that the hire is agreed on the platform.

**Why it matters.** B1: offers keep the end of the flow on one platform.

**From the PRD.**
- REQ-012: "The system includes the post-interview process on the platform."
- REQ-029: "A recruiter sends an offer to a selected candidate."

**Preconditions.**
- A selected candidate (US-01-007).

**Acceptance criteria.**

- AC-US-01-008-1. Given a selected candidate, when the recruiter enters terms and sends an offer, then the candidate sees it.
  Covers: REQ-029
- AC-US-01-008-2. Given a candidate who is not selected, when the recruiter tries to send an offer, then it is refused.
  Covers: REQ-029
- AC-US-01-008-3. Given a counter from the candidate, when the recruiter opens it, then they can accept it or send revised terms.
  Covers: REQ-029, REQ-012

**Not in this story.**
- The candidate's response (US-00-010)
- Contract signing (not in the PRD)

**Depends on.**
- US-01-007: a selected candidate

**Assumptions.**
- Counters can go back and forth any number of times (Q-021).

### US-01-009 Set the onboarding documents

Epic: EP-05   Priority: Could   Points: 2
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-021   Judgement: story

**Narrative.** As a Recruiter, I want to list the documents a hired candidate must provide, so that onboarding collects what my employer needs.

**Why it matters.** B1: onboarding keeps the post-hire steps on the same platform.

**From the PRD.**
- REQ-021: "The system provides an onboarding process after a candidate is hired."

**Preconditions.**
- The candidate accepted an offer (US-00-010).

**Acceptance criteria.**

- AC-US-01-009-1. Given an accepted offer, when the recruiter lists required documents, then the candidate sees the list.
  Covers: REQ-021
- AC-US-01-009-2. Given all required documents uploaded, when the recruiter opens onboarding, then it shows complete.
  Covers: REQ-021

**Not in this story.**
- Uploading the documents (US-00-011)
- A fixed document list (Q-009: each employer specifies)

**Depends on.**
- US-00-010: the accepted offer

**Assumptions.**
- Each employer specifies the documents (Q-009).

## EP-06 Set up an organization and its people

Goal: an org admin invites recruiters and recruiters invite interviewers
Covers: REQ-041, REQ-042, REQ-043, REQ-044

### US-01-010 Create an organization and invite recruiters

Epic: EP-06   Priority: Must   Points: 5
Persona: Org admin, group 01   Ticket: unassigned
Covers: REQ-041, REQ-042, REQ-044   Judgement: story

**Narrative.** As a Org admin, I want to create my organization and invite recruiters to it by email, so that my recruiters can use Hireva and see only my organization's data.

**Why it matters.** B1: recruiters belong to an organization and see only its data; without this no recruiter account exists.

**From the PRD.**
- REQ-041: "The system groups recruiters, interviewers and an org admin into an organization."
- REQ-042: "An org admin invites recruiters to the organization by email."
- REQ-044: "The system limits what each user sees by role (org admin, recruiter, interviewer, candidate) and by organization."

**Preconditions.**
- The visitor can sign up (US-00-012).

**Acceptance criteria.**

- AC-US-01-010-1. Given a visitor, when they sign up as an organization with a name, then the organization exists and they are its org admin (Q-034).
  Covers: REQ-041
- AC-US-01-010-2. Given an org admin, when they enter a recruiter's email, then an invitation email is sent and the invitee can create an account in that organization.
  Covers: REQ-042
- AC-US-01-010-3. Given an invitation, when the invitee accepts, then they become a recruiter of that organization only.
  Covers: REQ-042
- AC-US-01-010-4. Given a recruiter of organization A, when they open any posting, application, transcript or score, then they see only those of organization A.
  Covers: REQ-044
- AC-US-01-010-5. Given an org admin, when they remove a recruiter, then that person can no longer reach the organization's data.
  Covers: REQ-041

**Not in this story.**
- Inviting interviewers (US-01-011)
- A platform admin who manages organizations (Q-035)
- Billing and plans (not in the PRD)

**Depends on.**
- US-00-012: basic accounts

**Assumptions.**
- Signing up as an organization creates it with that user as org admin (Q-034).
- Invitation emails are sent through the auth provider's invite feature (assumption until built, ADR-0006).

### US-01-011 Invite interviewers

Epic: EP-06   Priority: Should   Points: 3
Persona: Recruiter, group 01   Ticket: unassigned
Covers: REQ-043, REQ-044   Judgement: story

**Narrative.** As a Recruiter, I want to invite interviewers to my organization by email, so that interviewers can be assigned to candidates and give feedback.

**Why it matters.** B1: interviewers join through a recruiter and see only the candidates assigned to them, by application number.

**From the PRD.**
- REQ-043: "A recruiter invites interviewers to the organization by email."
- REQ-044: "The system limits what each user sees by role (org admin, recruiter, interviewer, candidate) and by organization."

**Preconditions.**
- The recruiter belongs to an organization (US-01-010).

**Acceptance criteria.**

- AC-US-01-011-1. Given a recruiter, when they enter an interviewer's email, then an invitation email is sent and the invitee can create an account in the recruiter's organization.
  Covers: REQ-043
- AC-US-01-011-2. Given an invitation, when the invitee accepts, then they become an interviewer of that organization only.
  Covers: REQ-043
- AC-US-01-011-3. Given an interviewer, when they open the app, then they see only the candidates assigned to them, by application number.
  Covers: REQ-044

**Not in this story.**
- Assigning a candidate to an interviewer (US-01-003)
- Submitting feedback (US-00-009)

**Depends on.**
- US-01-010: the organization

**Assumptions.**
- Interviewers belong to one organization (inferred:).
