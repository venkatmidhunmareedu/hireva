# ADR-0011: Use Resend as the email sender for Supabase Auth

- Status: Accepted
- Date: 2026-10-21
- Task: none
- Deciders: user (project owner), after a critic finding in HLD review round 2
- Area: email
- Reversibility: cheap: only the SMTP settings in Supabase change

## Context

Three Must stories send email: sign-up confirmation, password reset (US-00-012) and organization invitations (US-01-010). Supabase's built-in sender was reported to reach only project team members at a low rate; this was not verified. Without a real provider, outside users cannot confirm, reset or accept an invitation. ADR-0006 chose Supabase Auth but did not choose an email sender.

## What else was considered

| Option | Why not | Would suit |
| --- | --- | --- |
| Resend (chosen) | free-tier limits and sending-domain setup not checked | a simple API and SMTP for a small project |
| Amazon SES | more setup (domain verification, leaving the sandbox) | high volume and low cost |
| Postmark | paid from the start | the best delivery for transactional mail |
| Supabase's built-in sender | reported team-members-only and low rate; not verified | local development |

## Decision

We will send Supabase Auth emails through Resend as Supabase's custom SMTP, because outside users must receive confirmation, reset and invitation emails, and Resend is the simplest provider to set up.

## Consequences

A sending domain with DKIM and SPF records is needed; none exists in the repository. The Resend API key lives in Supabase's SMTP settings, not on the VM. Notification emails to recruiters and waiting candidates stay out of scope until a story exists. Revisit if the free tier is too small, or if delivery to outside addresses fails.

## Commits us to

Resend
