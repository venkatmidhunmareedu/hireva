# Decision log

One row per technology decision. The ADR holds the full reasoning; this
table is the index. `tech-decision` maintains it.

| Date | Key | Choice | Recommended | Why it was chosen | ADR | Status |
| --- | --- | --- | --- | --- | --- | --- |
| 2026-10-21 | database | PostgreSQL | PostgreSQL | relational data and a separate identity store (Q-023) | ADR-0001 | Accepted |
| 2026-10-21 | backend language | Python (FastAPI) | Python (FastAPI) | best name-detection tooling for the scrubber; already used in hirekit | ADR-0002 | Accepted |
| 2026-10-21 | llm provider and models | OpenRouter | Anthropic Claude API | user chose one capped key to compare models on the spike; accepts the extra middleman | ADR-0003 | Accepted |
| 2026-10-21 | cloud | Oracle Cloud Always Free | Oracle Cloud Always Free | free, and the owner already has a deploy recipe (hirekit) | ADR-0004 | Accepted |
| 2026-10-21 | compute | Docker Compose + Caddy | Docker Compose + Caddy | about three services and one operator; matches hirekit | ADR-0005 | Accepted |
| 2026-10-21 | auth | Supabase Auth | Supabase Auth | separate store for emails (Q-023) and no password code to write | ADR-0006 | Accepted |
| 2026-10-21 | frontend | React with Vite+ | React with Vite | user chose the VoidZero toolchain; accepts beta status and a possible paid tier | ADR-0007 | Accepted |
| 2026-10-21 | api style | REST with OpenAPI | REST with OpenAPI | FastAPI generates the contract; typed React client from it | ADR-0008 | Accepted |
| 2026-10-21 | speech stack | Moonshine (speech-to-text) + Kokoro (text-to-speech), self-hosted | Deepgram for both directions | user chose that raw audio never leaves the host; accepts unproven speed on the free VM | ADR-0009 | Accepted |
| 2026-10-21 | api style (extension) | One interview WebSocket for audio, transcript and editor events | same | one connection per interview is simplest at v1 volume; extends ADR-0008 | ADR-0010 | Accepted |
| 2026-10-21 | email | Resend as Supabase Auth's custom SMTP | Resend | outside users must receive confirmation, reset and invitation emails; simplest setup | ADR-0011 | Accepted |
