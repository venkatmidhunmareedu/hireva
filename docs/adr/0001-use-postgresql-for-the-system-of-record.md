# ADR-0001: Use PostgreSQL for the system of record

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner)
- Area: database
- Reversibility: awkward: moving to another store means rewriting queries and the identity-split permissions

## Context

Hireva stores users, portfolios, postings, applications, interview messages and scores, and keeps candidate identity apart from anything evaluators read (docs/product/questions.md, Q-023). v1 uses fake data only (Q-014) at hobby volume. The owner's other project, hirekit, already uses PostgreSQL (not this repo; a hint only).

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| PostgreSQL (chosen) | needs a server or hosted plan | relational data with permission splits |
| SQLite | no separate permissions for the identity store; weak for concurrent use | a single-user demo on one machine |
| MongoDB | weaker for linked records and permission splits | portfolio-only document storage with no joins |
| Firestore / DynamoDB | vendor lock-in; poor for joins | serverless scale with known access patterns |

## Decision

We will use PostgreSQL, because the data is relational, the identity store needs its own table or schema with separate permissions (Q-023), and the owner already runs it.

## Consequences

Identity details live in a separate schema with its own role; evaluator-facing queries never read it. A hosting plan or a local server is needed. Revisit if v1 stays a single-user demo with no hosting, which would make SQLite enough.

## Commits us to

PostgreSQL
