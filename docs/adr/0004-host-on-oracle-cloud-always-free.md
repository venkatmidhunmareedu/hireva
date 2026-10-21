# ADR-0004: Host on Oracle Cloud Always Free

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: cloud
- Reversibility: cheap: the app ships as containers, so moving hosts means a new VM and DNS

## Context

Hireva is a solo hobby project with fake data only in v1 (Q-014). The owner's hirekit project already runs on one Oracle Always Free VM with Docker Compose and Caddy (hirekit deploy/oracle/README.md; not this repo, a hint only). Hosting budget is not in the repository; free or close to it is assumed.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Oracle Cloud Always Free (chosen) | free VMs can be reclaimed if idle; manual setup | a free host with a known deploy recipe |
| Hetzner VPS | costs a few euros a month | an Oracle VM that is reclaimed or unavailable |
| Google Cloud Run | the managed database costs money even at hobby scale | scale to zero and a monthly bill is acceptable |
| Cloudflare Workers and D1 | D1 is SQLite, which conflicts with ADR-0001 | an edge-only, static-leaning product |

## Decision

We will host on Oracle Cloud Always Free, because it costs nothing and the owner already has a working deploy recipe.

## Consequences

Setup and patching of the VM are manual. Revisit if the Always Free VM is reclaimed, or if the app needs more than one VM.

## Commits us to

Oracle Cloud Always Free
