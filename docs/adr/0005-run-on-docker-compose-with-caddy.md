# ADR-0005: Run on Docker Compose with Caddy

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: compute
- Reversibility: cheap: the same containers move to another orchestrator

## Context

ADR-0004 puts Hireva on one Oracle VM. The app is about three services (API, web, maybe a worker) run by one person. hirekit already runs this way (deploy/oracle; a hint only). Zero-downtime deploys are not required (assumed).

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Docker Compose on one VM with Caddy (chosen) | brief downtime on deploy; one machine is a single point of failure | a few services and one operator |
| Kubernetes (k3s) | heavy for three services and one person | many services or several teams |
| systemd without containers | harder to reproduce; differs from hirekit | one service and a fixed host |
| Oracle managed container service | not free | no wish to patch a VM |

## Decision

We will run the services with Docker Compose behind Caddy for HTTPS, because it is the simplest thing that fits three services and one operator, and it matches hirekit.

## Consequences

Deploys restart containers, so there is a short outage. Revisit if there are more than about ten services, more than one deployer, or a need for rolling deploys.

## Commits us to

Docker, Docker Compose, Caddy
