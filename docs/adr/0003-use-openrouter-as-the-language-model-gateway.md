# ADR-0003: Use OpenRouter as the language-model gateway

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner); chosen against the recommendation (Anthropic Claude API via one gateway module)
- Area: llm provider and models
- Reversibility: cheap: every call goes through one module, so changing provider changes one file

## Context

The product calls a model in four places: the agent interview, the scrubber's second pass, and the AI-proposed personas and rubric. Q-024 says the model sees only scrubbed text; Q-014 says v1 uses fake data only. These calls are billed to a product API key, never to a Claude Code subscription. Monthly budget is not in the repository; a small capped one is assumed.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| OpenRouter (chosen) | an extra middleman that sees candidate text | prototypes and comparing models with one capped key |
| Anthropic Claude API direct (recommended) | one vendor | a stable choice of one model family, tiered by task |
| Cloud gateway (Vertex or Bedrock) | needs a cloud account not yet in place | data that must stay inside a cloud contract |
| Self-hosted open model | GPU cost and ops work; weaker interviewer quality | text that may never leave the machine |

## Decision

We will route all model calls through OpenRouter behind one gateway module, because one capped key lets the scrubber spike compare models, and the module keeps the provider swappable.

## Consequences

Q-024 matters more: unscrubbed candidate text must never reach OpenRouter or any model. Model ids are set per task in one config. Before real candidate data is used (Q-014), re-check whether a direct or cloud-contract provider is needed. Revisit if the spike settles on one model family or privacy needs tighten.

## Commits us to

OpenRouter
