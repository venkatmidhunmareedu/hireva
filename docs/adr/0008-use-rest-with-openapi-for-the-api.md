# ADR-0008: Use REST with OpenAPI for the API

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: api style
- Reversibility: awkward: changing style means rewriting routes and the generated client

## Context

One client (the React app, ADR-0007) talks to one backend (FastAPI, ADR-0002). FastAPI produces an OpenAPI contract by itself. The shared code box needs a live channel. No mobile app or third-party integration is planned (assumed).

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| REST with OpenAPI (chosen) | some screens need several calls | one backend and one or two clients |
| GraphQL | a schema layer to own for one client | many clients needing different shapes of the same data |
| gRPC | not browser-native without a proxy | service-to-service traffic |
| tRPC | TypeScript on both sides only | a single TypeScript codebase |

## Decision

We will expose REST routes described by OpenAPI, plus one WebSocket route for the shared code box, because FastAPI generates the contract, a typed React client can be generated from it, and nothing needs GraphQL's flexibility.

## Consequences

The OpenAPI file is the contract between backend and frontend. Revisit if more clients with different data needs appear.

## Commits us to

OpenAPI 3.1, WebSocket
