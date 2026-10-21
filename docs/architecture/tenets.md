# System design tenets: Hireva

Rules this team holds itself to on this project. Each is here because somebody could plausibly do the opposite, and a reviewer can point at a breach.

## 1. Only the reveal route can read the identity schema

**Evaluator-facing code never reads the identity schema: only the reveal route's database role can SELECT from it, that route runs only for a candidate marked selected, and the app role can only INSERT (sign-up).**
The promise of the product is that people who judge a candidate cannot see who they are (Q-023, ADR-0001). A shared database role makes one careless query enough to break it.
_A breach looks like:_ a merge request adds a scoring query that joins identity.people to show the candidate's initials, using the same database role as the rest of the API, or grants SELECT on the identity schema to the app role.

## 2. Raw audio never touches disk, logs or the database

**Audio exists only in memory while it is streamed and transcribed; no code writes audio bytes to a file, a log line, a queue or a table.**
Audio carries voice and anything said aloud, and REQ-036 promises it is discarded (ADR-0009).
_A breach looks like:_ a merge request saves each audio chunk to /tmp "to debug the speech delay" and forgets to remove it.

## 3. Spoken text is scrubbed before any model sees it

**Every transcript passes the name-detection pass before it is stored or sent to any model; the model pass only ever receives text that pass has cleaned.**
This is Q-024 and the conflict 1 decision: OpenRouter is a third party (ADR-0003). Typed editor text is the one stated exception (Q-027).
_A breach looks like:_ a merge request sends the raw transcript to the model gateway "to improve scrubbing accuracy" before the name-detection pass runs.

## 4. Every model call goes through the one gateway module

**Only the model gateway module imports an HTTP client for OpenRouter; routes and services call the gateway.**
One module is where the scrubbed-text rule, the spend cap, timeouts and the provider swap live (ADR-0003).
_A breach looks like:_ a route handler calls OpenRouter directly with the requests library to try a new prompt.

## 5. The scrubber fails closed

**If the scrubber raises or times out, the turn is neither stored nor shown; there is no fallback to the unscrubbed text. An agent reply already spoken stays in the transcript marked orphaned.**
A fail-open scrubber turns every outage into a leak (US-00-005).
_A breach looks like:_ a try/except around the scrubber that falls back to saving the original transcript so the interview "does not break".

## 6. Logs and traces never contain candidate content

**Log lines carry ids, routes, status and timings, never transcript text, typed text, audio or identity fields.**
Logs are copied, shipped and kept longer than the database; a name in a log defeats the identity schema.
_A breach looks like:_ a merge request logs the full request body of the interview WebSocket at debug level.

## 7. Speech sits behind one module

**Hireva API talks to speech only through the speech client module and the HirevaSpeech contract, never to Moonshine or Kokoro directly.**
ADR-0009 is a bet that may need to flip to a hosted service; that must be a change in one place.
_A breach looks like:_ a route imports the Moonshine library inside the API container to transcribe a short clip faster.
