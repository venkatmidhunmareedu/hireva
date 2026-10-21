# ADR-0007: Use React with Vite+ for the frontend

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner); chose Vite+ where the recommendation was plain Vite
- Area: frontend
- Reversibility: cheap: Vite+ wraps Vite, so going back to plain Vite changes the toolchain commands, not the app code

## Context

Hireva is a signed-in web app (candidate, recruiter and interviewer screens), so SEO and server rendering do not matter. It has a real-time shared code box (US-00-006). The backend is FastAPI (ADR-0002) and Caddy can serve static files (ADR-0005). hirekit uses React with Vite (a hint only). Vite+ is VoidZero's unified toolchain (Vite, Vitest, Oxlint, Rolldown); a July 2026 beta write-up says it is MIT-licensed beta with a paid tier possible later and no pricing announced (secondary sources; official pricing page not checked). Cloudflare announced it was acquiring VoidZero in June 2026 and said the tools stay MIT open source.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| React with Vite+ (chosen) | beta toolchain; a paid tier may come | wanting one command for build, test and lint |
| React with plain Vite (recommended) | none: stable, matches hirekit | a stable toolchain with the least risk |
| Next.js | adds a Node server beside FastAPI | public pages that must rank in search |
| SvelteKit | a new framework for the owner | a team already on Svelte |

## Decision

We will build the frontend as a React single-page app on Vite+, served as static files by Caddy, because it is an authenticated app that needs no server rendering and the owner chose Vite+ for its single toolchain.

## Consequences

Vite+ is beta, so breaking changes are possible. Revisit if Vite+ announces paid pricing that affects this project, ships a breaking release we cannot absorb, or stalls; fall back to plain Vite. A public landing page that must rank in search would need Next.js or a separate static site.

## Commits us to

React, Vite+ (Vite, Vitest, Oxlint, Rolldown)
