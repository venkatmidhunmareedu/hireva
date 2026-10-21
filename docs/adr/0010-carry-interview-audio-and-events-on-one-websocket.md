# ADR-0010: Carry interview audio, transcript and editor events on one WebSocket

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner), settling HLD conflict 2
- Area: api style
- Reversibility: awkward: the browser and the API both speak this message format

## Context

ADR-0008 allows one WebSocket route, for the shared code box only. The voice interview (REQ-037) also needs live audio from the browser, transcripts, the agent's spoken reply and editor text, all within one interview. This ADR extends ADR-0008; it does not replace it, and REST with OpenAPI stays the style for everything else.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| One interview WebSocket for audio, transcript and editor events (chosen) | one connection carries mixed traffic, so messages need a type field | a single interview per connection |
| Two WebSockets, audio and editor | two connections to keep in step if one drops | audio handled by a separate service |
| WebRTC for audio | heavier setup and a new dependency | many concurrent audio streams or peer-to-peer |

## Decision

We will carry audio chunks, transcript events, the agent's audio and editor text on one WebSocket per interview at `/v1/interviews/{id}/socket`, described in the OpenAPI file's WebSocket notes, because one connection per interview is the simplest thing that works at v1 volume.

## Consequences

A dropped connection ends the audio stream; the interview resumes from the last stored turn when the browser reconnects. Revisit if concurrent interviews pass what one API process can stream, or if audio quality over WebSocket is poor.

## Commits us to

WebSocket
