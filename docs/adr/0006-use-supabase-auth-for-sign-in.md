# ADR-0006: Use Supabase Auth for sign-in

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: auth
- Reversibility: awkward: moving providers means migrating accounts and password hashes

## Context

Q-023 sets email sign-in with identity details stored apart from anything evaluators read. There are three roles (candidate, recruiter, interviewer), and an evaluator reaching a candidate's identity would break the product's promise. hirekit already uses Supabase for PostgreSQL (a hint only). Whether Hireva uses Supabase-hosted PostgreSQL is assumed yes; ADR-0001 does not say how PostgreSQL is hosted.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Supabase Auth (chosen) | ties auth to Supabase; roles and row-level access are still ours to write | email sign-in on a Supabase-hosted PostgreSQL |
| Own implementation | we would own password storage and session bugs | a simple internal tool |
| Auth0 | another account and free-plan limits | enterprise single sign-on |
| Keycloak | heavy to run for a solo project | self-hosting is a requirement |

## Decision

We will use Supabase Auth with Supabase-hosted PostgreSQL, because emails and credentials then live in a separate auth schema, we write no password or session code, and it matches what the owner already runs.

## Consequences

The API verifies Supabase's JWT and checks the role on every request. Evaluator-facing queries never read the identity schema (Q-023). Candidate emails are held by a third party. Revisit before real candidate data is used (Q-014), or if single sign-on or no-third-party storage becomes a requirement.

## Commits us to

Supabase Auth, Supabase-hosted PostgreSQL
