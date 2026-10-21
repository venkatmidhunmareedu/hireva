# ADR-0002: Use Python and FastAPI for the backend

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: backend language
- Reversibility: awkward: a language change means rewriting the API and the scrubber

## Context

The riskiest story is the scrubber (US-00-005): name detection plus a language-model pass over free text. The product calls a language model in four places (agent interview, scrubber, AI-proposed personas and rubric). The owner's hirekit project already runs Python 3.14 and FastAPI (not this repo; a hint only). The shared code box (US-00-006) needs WebSockets.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Python with FastAPI (chosen) | real-time support is less polished than Node's | name detection, PII tooling and LLM SDKs |
| TypeScript (Node) | weaker name-detection and PII tooling | one language end to end with a real-time-heavy frontend |
| Go | thin name-detection ecosystem; the scrubber would call Python anyway | simple, fast services without NLP |
| Java / Kotlin | heavy for a solo hobby project | an existing JVM estate |

## Decision

We will use Python with FastAPI, because the scrubber is the riskiest story and Python has the best name-detection and PII libraries, and the owner already runs this stack.

## Consequences

The shared code box uses FastAPI's WebSocket support; revisit if real-time proves hard. The frontend stays a separate decision (still open).

## Commits us to

Python, FastAPI
