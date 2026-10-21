@AGENTS.md

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Status

No code yet: the repo holds planning documents only, so there are no build, lint or test commands and no architecture to describe. Re-run `/init` once code exists.

What exists, read these before building:
- `docs/product/PRD.md`: 45 requirements (4 withdrawn); `docs/product/questions.md`: 33 decisions, all confirmed, so treat them as settled.
- `docs/product/backlog.md` (23 stories, sized) and `docs/product/coverage.md` (a script checks that every requirement is covered; rerun it after editing: `python3 ~/.claude/plugins/cache/bearing/bearing/0.6.0/skills/backlog/scripts/coverage_check.py` from the repo root).
- `docs/adr/` and `docs/decisions.md`: the decided stack (below).
- `docs/spike/leaky-answers.md`: 10 leaky answers to test the scrubber (US-00-005) before building on it.

Ids are permanent: never renumber REQ, Q or US ids; withdraw and replace instead.

## Decided stack (not yet scaffolded)

React on Vite+ (ADR-0007) talking REST with OpenAPI plus one WebSocket route for the shared code box (ADR-0008) to a Python FastAPI backend (ADR-0002); PostgreSQL hosted on Supabase with Supabase Auth (ADR-0001, ADR-0006); model calls go through one gateway module to OpenRouter (ADR-0003); deployed with Docker Compose and Caddy on an Oracle Cloud Always Free VM (ADR-0004, ADR-0005). Speech is self-hosted: Moonshine for speech-to-text and Kokoro for text-to-speech (ADR-0009); nobody has run them on the Oracle VM yet. Object storage (for onboarding documents) is still undecided.

## Project intent

Hireva is a hobby project for anonymous hiring: candidate identity (name, school, employer) stays hidden through screening, interview and tests, and is revealed only after selection. The approved design doc is `~/.gstack/projects/hireva/midhun-unknown-design-20261021-152535.md`. It covers scope, premises and open questions; read it before building.

Planned v1: a candidate-side leak linter for portfolios, plus an anonymous voice interview with an AI agent (voice is the main channel; the agent can ask for a typed text or code answer in a platform editor, no free chat box) whose transcript is scrubbed of identity clues and whose audio is discarded before a recruiter scores it. Gender and accent leaks are accepted for v1. No video or screen sharing. Constraints that cut across files: candidate identity lives in a separate schema that evaluator-facing queries never read (Q-023); transcribed speech is scrubbed before it is stored or sent to any model (Q-024); typed text and code are not scrubbed, the editor shows an identity-clue warning instead (Q-027, Q-028); v1 uses fake data only (Q-014).

## Skill routing

When the user's request matches an available skill, invoke it via the Skill tool. When in doubt, invoke the skill.

Key routing rules:
- Product ideas/brainstorming → invoke /office-hours
- Strategy/scope → invoke /plan-ceo-review
- Architecture → invoke /plan-eng-review
- Design system/plan review → invoke /design-consultation or /plan-design-review
- Full review pipeline → invoke /autoplan
- Bugs/errors → invoke /investigate
- QA/testing site behavior → invoke /qa or /qa-only
- Code review/diff check → invoke /review
- Visual polish → invoke /design-review
- Ship/deploy/PR → invoke /ship or /land-and-deploy
- Save progress → invoke /context-save
- Resume context → invoke /context-restore
- Author a backlog-ready spec/issue → invoke /spec
