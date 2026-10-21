# AGENTS.md

The standard every AI coding agent follows in this repository (Claude Code, Cursor, Codex, Gemini CLI, Copilot). It loads into every session, so it holds only what applies on every turn; the skills carry each step's detail.

Each step of the workflow names one skill, from Bearing or from another installed pack. Unsure which one: `workflow` names the next step and its skill.

## This repository

Hireva is an anonymous interview platform: a candidate is interviewed and scored without the evaluators seeing who they are, and identity is revealed only after the hiring is completed. This repository is the planning repository. It holds requirements, decisions and design, and no application code. The code lives in four other repositories named in `docs/architecture/repo-plan.json` (HirevaClient, HirevaApi, HirevaSpeech, HirevaInfra).

- Setup: after cloning, run `make setup` once. It sets `core.hooksPath` to `.githooks`; without it, none of the commit, push or secret checks run.
- Gate: `make check` runs three planning gates: `make coverage` (every live requirement is covered by a backlog story, and the question register agrees), `make arch` (the HLD, tenets, decisions index and repo plan agree) and `make diagrams` (the drawn diagrams are complete and legible). They need the Bearing plugin; set `BEARING=<path>` if it is not under `~/.claude/plugins/cache/bearing/bearing/0.6.0`.
- Where things are: `docs/product/` (PRD, questions register, backlog, coverage matrix, estimate), `docs/design/hireva-design-doc.md` (the approved product design from the first office-hours session), `docs/design/hireva-hld.md`, `docs/architecture/` (tenets, decisions index, repo plan, C4 views, drawn diagrams), `docs/adr/` and `docs/decisions.md` (one ADR per decision, numbered), `docs/spike/` (the scrubber test answers).
- Ids are permanent: `REQ-nnn`, `Q-nnn`, `US-gg-nnn`, `ADR-nnnn` and `AC-...` are cited from other files and from commits. Never renumber or reuse one. A changed meaning is a new id, and the old one is marked `withdrawn:` with the date. A confirmed register entry is never rewritten; add a dated reversal line instead.
- Never edit an Accepted ADR to match a change. Write a new ADR that extends or supersedes it, and name it in `docs/architecture/decisions.md`.
- The decided stack and the rules that cross files are in `CLAUDE.md` (identity schema read only by the reveal route, transcribed speech scrubbed before it is stored or sent to a model, v1 uses fake data only).

Traps found when this repository was onboarded:
- `docs/product/coverage.md` ends with the gate's counts line pasted in. It goes stale after any backlog or PRD edit; rerun `make coverage` and paste the new line.
- Story Points in the backlog index must equal the Points line in each story block, or the gate fails.
- `.gstack/` is the local state of another tool and is ignored. Do not commit it.

## Ground rules

Breaking one gets the change rejected, whatever else it does.

1. Never commit to `main`. Work on a task branch.
2. Never push, open a merge or pull request, merge, tag or deploy. Prepare the command and hand it to the engineer.
3. Never commit a secret, key, certificate or `.env` file, and never read one into context.
4. Never touch a production system, database or bucket, not even to read.
5. Never rewrite history: no amend, rebase, force-push, `reset --hard`.
6. Never weaken a guardrail to go green: no lint suppression, no skipped test, no lowered threshold, no relaxed CI rule.
7. Never add a dependency nobody asked for; propose it with the reason.
8. Never invent an API, field, table, variable or command; find it in the code first.
9. Stay in scope. What you notice in passing goes under "Noticed", unfixed.
10. Report honestly: a check you did not run is "not run", never "passing".
11. No AI attribution in commits, requests or documents.
12. No em dashes in prose; rewrite the sentence.

## Working here

- Every change has a task id and a branch: `start-task` creates `feature|bugfix|chore|docs/<ID>-<PascalName>`. The task id prefix is `HV`. One task per session.
- Every command is a Makefile target; `make help` lists them and `make check` is the gate.
- Search before reading, open only what you located, and copy the shape and naming of the closest existing document.
- A technology choice is never silent: `tech-decision` gives options and a recommendation, the engineer decides, `adr` records it.
- Commits are Conventional with the task id at the end of the subject: `docs(design): settle the reveal audience [HV-12]`.
- State that must outlive the session: `.bearing/state/` via `session-handoff` (local, ignored). Scratch: `.scratch/`. Nothing at the root such as `NOTES.md`.
- Done means `definition-of-done` passed with evidence.

## Reporting

End every task in this shape: `## Changed` (path: what and why), `## Verified` (the command and the tail of its output), `## Not done` (asked, not delivered, why), `## Noticed` (seen in passing, not fixed). No full diffs, no restating the task.
