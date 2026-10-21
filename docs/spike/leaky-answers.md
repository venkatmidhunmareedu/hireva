# Scrubber spike: 10 deliberately leaky answers

All names, schools, employers and places are fake. Test set for US-00-005 (Q-011 list: name, school, employer, city, spouse, nickname). Run each answer through the scrubber, then fill the last column by hand.

Scoring: for each answer count the clues listed under "Expected clues". A clue is caught if it no longer appears in the output. Also note false removals (text removed that was not a clue). Pass bar for the spike: decide before running (suggested: every direct clue caught, indirect misses reported).

| # | Answer (interview text) | Expected clues | Kind |
| --- | --- | --- | --- |
| 1 | "Hi, I'm Priya Nair. I have five years of backend experience and enjoy building payment systems." | Priya Nair (name) | direct |
| 2 | "I studied computer science at Greenfield Institute of Technology, where I led the robotics club." | Greenfield Institute of Technology (school) | direct |
| 3 | "At my last job at Brightwave Logistics I rebuilt the routing service and cut delivery errors by a third." | Brightwave Logistics (employer) | direct |
| 4 | "I live in Coimbatore, so I'm used to working with teams in other time zones." | Coimbatore (city) | direct |
| 5 | "My wife Meera and I moved last year, and the move taught me a lot about planning under deadlines." | Meera (spouse) | direct |
| 6 | "Everyone calls me Ginger, even in standups, and I usually take the on-call rotation on Fridays." | Ginger (nickname) | direct |
| 7 | "I did my degree at the college by the river in the old textile town, the one famous for its cricket ground." | school and city, described indirectly | indirect |
| 8 | "Before this I was the second engineer at a ten-person startup that made smart irrigation sensors in Pune." | employer (described), Pune (city) | indirect |
| 9 | "My brother Arjun, who is a pilot, says I over-plan, and honestly he's right." | Arjun (family member, not on the Q-011 list: record whether it is removed) | boundary |
| 10 | "Please call me Dr. Menon. My thesis at Greenfield was on queueing theory, supervised by Prof. Rao, and my first job after that was at Brightwave." | Menon (name), Greenfield (school), Rao (supervisor name), Brightwave (employer) | mixed |

## Results

Run on 2026-10-21 with spaCy 3.8 and `en_core_web_sm` (small English model), entity labels PERSON, ORG, GPE, LOC, FAC, NORP replaced by a placeholder. Name-detection pass only: the language-model pass did not run because no OpenRouter key was set.

| # | Caught | Missed | False removals | Notes |
| --- | --- | --- | --- | --- |
| 1 | 1/1 | none | 0 | name |
| 2 | 1/1 | none | 0 | school (ORG) |
| 3 | 1/1 | none | 0 | employer (ORG) |
| 4 | 1/1 | none | 0 | city (GPE) |
| 5 | 1/1 | none | 0 | spouse (PERSON) |
| 6 | 1/1 | none | 0 | nickname (PERSON) |
| 7 | 0/2 | "the college by the river", "old textile town" | 0 | indirect school and city: not seen as entities |
| 8 | 1/2 | "ten-person startup" | 0 | Pune caught as LOC; the employer was only described |
| 9 | 1/1 | none | 0 | Arjun removed (PERSON); family names are not on the Q-011 list, so decide if this is wanted |
| 10 | 4/4 | none | 0 | all removed; Greenfield labelled PERSON, Brightwave ORG, so category labels are unreliable but removal works |

Totals: 12 of 15 clues caught (answers 1 to 6, the direct ones, 6 of 6; answers 7 to 10, 6 of 9). All 3 misses are indirect descriptions. 0 false removals on these 10.

Limits: I wrote both the answers and the expected-clue list, the sample is ten, the model is the small one, and answers are short. Read it as "direct clues are easy, indirect clues need the language-model pass", not as a measured miss rate. Still to do: run the language-model pass on the three misses and on a set someone else wrote.
