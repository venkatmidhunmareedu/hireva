# Estimate

Backlog: docs/product/backlog.md   Sized: 2026-10-21   Team: 1 person (design doc: solo hobby project; unconfirmed: hours per week)
Previous estimate: none. The only earlier figure is "2 to 3 weekends" in the design doc, which had no sizes behind it and covered a smaller v1 (Q-010 before it was extended).

## 1. Verdict

Does not fit the 2 to 3 weekend window, even for the Musts alone, under any pace I can defend. No sprint log, calendar or velocity exists, so every capacity number below is an assumption (unconfirmed:), not a measurement.

Remaining: 86 points (Must 52, Should 19, Could 15) across 23 stories. Two more points of unsized work (notifications) are outside the headline (section 5).

Weekends needed at two assumed paces (A1):

| Tier | Points | At 3 points a weekend | At 6 points a weekend | Fits 2 to 3 weekends? |
| --- | --- | --- | --- | --- |
| Must | 52 | 17.3 weekends | 8.7 weekends | No (-43 to -46 points at 3 a weekend, -34 to -40 at 6) |
| Must + Should | 71 | 23.7 | 11.8 | No |
| All | 86 | 28.7 | 14.3 | No |

A pace that would make the Musts fit in 3 weekends is 17.3 points a weekend, 2 to 4 times the assumed paces. Nothing here measures your pace; if you tell me the hours you really have and how long a comparable story took you, I will re-run this.

Proposed (awaiting you, nothing changed in the backlog):
- Cut AC-US-01-001-3 to AC-US-01-001-6 (the AI persona and rubric proposals) from US-01-001, leaving post and close, with a fixed default persona and rubric. US-01-001 drops from XL 8 to S 2; Must becomes 46.
- US-00-003 (apply) stays in the first cut: it was promoted to Must in the HLD (conflict 3).
- The smallest set that still proves the idea is US-00-005, US-00-004, US-01-004, US-00-006 (19 points), plus US-00-001 and US-00-002 (8) = 27, or 5 to 9 weekends at the assumed paces. That is still more than 3.

## 2. Scope

All 23 stories are In backlog with no Status line, so all are treated as not started; none is done, in progress or withdrawn. No story is refused: every one has acceptance criteria. REQ-017 (proctoring) is out of scope by Q-002 and is not sized. There are no ADRs and no code, so no ADR conflicts and no existing parts to check.

## 3. Story sizes

| Story | Priority | Previous | Size | Points | Drivers | Assumptions |
| --- | --- | --- | --- | --- | --- | --- |
| US-00-001 | Must | none | M | 3 | new screen, schema, depends on sign-in | A2 |
| US-00-002 | Must | none | L | 5 | new screen, 5 AC, detection over free text, gates publishing | A3 |
| US-00-003 | Must | none | M | 3 | new screen, 5 AC, duplicate check, creates the interview | A2 |
| US-00-004 | Must | L 5 (before the voice correction) | XL | 8 | real-time voice in and out through two self-hosted models, LLM integration, 7 AC, new boundary; split with backlog | A3, A4, A12 |
| US-00-005 | Must | none | L | 5 | NER plus LLM scrubbing of speech and typed text, 7 AC, fail-closed path, unconfirmed accuracy | A3, A5 |
| US-00-012 | Must | none | M | 3 | email and password, Google sign-in, reset by email, name written to the identity schema | A2, A13 |
| US-00-006 | Must | none | M | 3 | editor for text and code answers with an identity-clue linter (REQ-038, Q-028) | A6 |
| US-00-007 | Should | none | XL | 8 | real-time audio, speech-to-text, scrubbing a transcript, 5 AC; split with backlog | A7 |
| US-00-008 | Could | none | M | 3 | new screen, recruiter-authored test content | A2 |
| US-00-009 | Should | none | S | 2 | one form | A2 |
| US-00-010 | Could | none | M | 3 | 4 AC, counter thread | A2 |
| US-00-011 | Could | none | L | 5 | file upload, OCR integration, 4 AC | A8 |
| US-01-001 | Must | none | XL | 8 | 6 AC, two LLM proposal flows with regenerate, CRUD; split with backlog | A3, A9 |
| US-01-002 | Must | none | M | 3 | list and detail screens, search that must hide fields | A2 |
| US-01-003 | Should | none | M | 3 | 4 AC, notification, round types | A2, A10 |
| US-01-004 | Must | none | M | 3 | scoring screen, rubric from the posting | A9 |
| US-01-005 | Should | none | XS | 1 | one read-only view | A2 |
| US-01-006 | Should | none | S | 2 | flag action that voids a score | A2 |
| US-01-007 | Must | none | M | 3 | identity held apart from evaluator screens, access control | A11 |
| US-01-008 | Could | none | S | 2 | offer form, 3 AC | A2 |
| US-01-009 | Could | none | S | 2 | document list, 2 AC | A2 |
| US-01-010 | Must | none | L | 5 | organizations, invitation emails, role and organization scoping on every query, 5 AC | A2, A13 |
| US-01-011 | Should | none | M | 3 | second invitation flow, interviewer scoping | A13 |

Totals: Must 52, Should 19, Could 15, 86 in all.

Assumptions:

- A1. Pace is 3 or 6 points a weekend. unconfirmed: no sprint log, no past stories, no hours given.
- A2. Plain web screens on a stack the team already knows. unconfirmed: the stack is undecided (tech-decision comes next).
- A3. A language model API and a name-detection library are available without a procurement wait. unconfirmed:
- A4. One interview runs as a text chat; the persona comes from the posting or a default (Q-025). Confirmed by docs/product/questions.md.
- A5. The scrubber reaches the Q-011 list with the one-evening spike. unconfirmed: the spike has not run. If it fails, US-00-005 is XL 8 or higher and the scope must be cut.
- A6. A hosted real-time service, not a hand-built one. unconfirmed:
- A7. A hosted speech-to-text service is acceptable under Q-019 (audio discarded after transcription). unconfirmed: the vendor sees the audio.
- A8. A hosted OCR service. unconfirmed:
- A9. Persona and rubric proposals are prompts to the same language model API. unconfirmed:
- A10. Email notifications are enough. unconfirmed: no story or Q covers notifications.
- A13. The auth provider's invite feature sends the invitation emails, so no separate email service is needed. unconfirmed: nobody has tried it (ADR-0006).
- A12. Moonshine (speech-to-text) and Kokoro (text-to-speech) run self-hosted on the Oracle VM, 2 cores and 12 GB (the owner's choice), fast enough for a conversation, one interview at a time. unconfirmed: nobody has run them on that VM; a one-evening latency test decides it (ADR-0009). Prebuilt aarch64 wheels exist for Python 3.14 (dependency resolution check, 2026-10-21, not an install on the VM).
- A11. Identity is stored in a separate table behind a separate permission. Confirmed by Q-023 in docs/product/questions.md.

## 4. Capacity

No sprint log, no calendar, no leave or holidays known, so velocity is unconfirmed: and so is the window. The only window in the input is "2 to 3 weekends" (design doc). Capacity at the two assumed paces:

- 3 points a weekend x 2 to 3 weekends = 6 to 9 points.
- 6 points a weekend x 2 to 3 weekends = 12 to 18 points.

Both are below the 38 Must points. The "2 to 3 weekends" figure is checked against the backlog and not supported by it. It was written for the original 5-story v1, which at these sizes is still about 24 points.

Team size 1, from the design doc (unconfirmed: hours per weekend).

## 5. Gaps and calendar risks

Gaps:
- Sign-in, organizations and invitations now have requirements (REQ-039 to REQ-045) and stories (US-00-012, US-01-010, US-01-011), sized above. They added 11 points.
- Notifications are used in several AC (US-01-003 and others) with no requirement or story. Guessed size S 2, kept out of the headline.
- Priority inversion resolved: US-00-003 was promoted to Must (HLD conflict 3, 2026-10-21).
- US-00-004 (Must) takes its persona from the posting but does not list US-01-001 under Depends on. Flagged, not edited.
- US-00-007 and US-00-011 depend on external services (speech-to-text, OCR) whose cost and terms are unknown.
- No cycles found by following Depends on edges.
- US-01-001 and US-00-007 are XL: split with backlog.

Lead-time items: no external dependency with a known lead time. Language-model, speech-to-text and OCR accounts are assumed self-serve (A3, A7, A8). Trigger: if any account needs approval or a paid plan that takes more than a few days, the stories behind it move out of the first cut.

## 6. Plan

Proposed order only (nothing scheduled), each step leaving something usable:

1. Scrubber spike on the 10 answers in docs/spike/leaky-answers.md, then US-00-005. This decides A5 and the whole estimate.
2. US-00-004 (agent interview) and US-00-006 (shared code box): a candidate can be interviewed.
3. US-00-001 and US-00-002: a candidate can write and clear a portfolio.
4. US-01-001 (or its cut version), then US-00-003 and US-01-002: a recruiter can post a job and browse anonymous applicants.
5. US-01-004 and US-01-007: a recruiter can score and reveal a selected candidate.
6. Should and Could stories only after step 5.

## 7. Task hours

0 tasks: hours not estimated. docs/product/tasks.md does not exist.
