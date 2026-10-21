# ADR-0009: Self-host Moonshine and Kokoro for speech

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner); chose against the recommendation (hosted Deepgram for both directions)
- Area: speech stack
- Reversibility: cheap: speech goes through one module, so switching to a hosted service changes that module and the Compose file

## Context

The agent interview is voice-first (REQ-037). A hosted speech service would hear the candidate's raw voice, including any name said aloud, before the scrubber runs (Q-026). v1 uses fake data only (Q-014). The app runs as Docker Compose services on one Oracle Always Free VM (ADR-0004, ADR-0005). Research on 2026-10-21, mostly vendor and comparison pages, so directional: Moonshine's streaming models report low CPU latency (Small Streaming 7.84% word error rate, 123M parameters, versus 8.59% for Whisper Small); Kokoro (82M parameters, Apache 2.0) runs faster than real time on CPU; Piper is lighter but a 2026 comparison lists it as GPL-3.0. Moonshine's language coverage beyond English and Kokoro's speed on this ARM VM were not verified.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Moonshine plus Kokoro, self-hosted (chosen) | nobody has run them on this VM; we operate two more containers | audio must never leave the host |
| Deepgram for both directions (recommended) | vendor hears the raw voice before the scrubber | fast start with fake data |
| Deepgram speech-to-text plus Cartesia voice | two vendors; both hear or generate voice off-host | a nicer, faster agent voice |
| Google Cloud speech and text-to-speech | cloud account and setup not in place | a cloud data contract |
| Whisper (small or base) | at least about 500 ms on small ARM hardware per the Moonshine paper (secondary source) | many languages |
| Parakeet | accuracy-focused; heavier than Moonshine on small CPUs (source also ships these models) | English and major European languages with more compute |
| Piper | GPL-3.0 per one comparison; less natural voice | the lowest resource use |

## Decision

We will run Moonshine for speech-to-text and Kokoro for text-to-speech as containers beside the API on the Oracle VM, because the raw voice then never leaves our host, and both models are small enough to try on CPU.

## Consequences

Two more services to run and patch in Compose. The free VM may be too slow: run a one-evening latency test before building US-00-004, measuring the time from the end of the candidate's speech to the start of the agent's audio. Proposed revisit trigger: if that delay is over about 2 seconds, or the models do not understand the candidates' accents, switch to the recommended hosted option and re-check privacy (Q-014). Language coverage is assumed to be English only.

## Commits us to

Moonshine, Kokoro (Apache-2.0)
