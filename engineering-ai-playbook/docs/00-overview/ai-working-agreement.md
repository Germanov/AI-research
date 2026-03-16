# AI Working Agreement

## Purpose

This document defines how we use GitHub Copilot in our engineering work.

It is a working agreement for developers and QA, not a tool manual.
The goal is to make AI usage consistent, safe, reviewable, and useful across our team.

---

## Core Position

We use Copilot as an assistant, not as an authority.

Copilot should help us:
- understand code faster
- plan changes more clearly
- draft implementation and tests faster
- improve review quality
- improve consistency in communication and verification

Copilot should not:
- make architectural decisions by default
- replace engineering judgment
- justify weak verification
- widen scope silently
- reduce code quality in exchange for speed

---

## Team Rules

### 1. Plan first for non-trivial work
For work that touches multiple files, contracts, UI behavior, or data logic, start with understanding and planning before implementation.

### 2. Prefer the smallest safe change
We do not use AI to create broad rewrites unless the task explicitly requires that.

### 3. Respect existing architecture
Our service patterns, API toolkit, Angular theme, Entity Framework usage, stored procedures, and persistence choices are intentional.
AI should align with them unless redesign is explicitly requested.

### 4. Ask questions before writing code
Use Copilot to understand:
- the existing pattern
- related files
- affected contracts
- test coverage
- likely risk areas

### 5. Verification is mandatory
A task is not done when code is written.
A task is done when behavior is verified with evidence.

### 6. Be explicit about uncertainty
If something was not verified, or if part of the behavior is assumed, say so clearly.

### 7. Keep changes reviewable
AI-generated work must stay small enough and clear enough for a strong reviewer to evaluate safely.

### 8. QA remains evidence-based
AI can improve bug reports and test thinking, but it does not replace QA judgment or real verification.

---

## What Good AI Usage Looks Like

Good AI usage produces work that is:
- smaller in scope
- clearer in intent
- aligned with existing patterns
- easier to review
- better verified
- more honest about risk

---

## What Bad AI Usage Looks Like

Bad AI usage includes:
- vague prompts
- broad refactors with weak justification
- generated code accepted without review
- weak or missing verification
- architecture drift
- polished summaries with no evidence behind them

---

## Continuity Rule

Important work must leave durable context.

Plans, decisions, verification, and handoff notes should be written in stable project artifacts such as:
- Azure DevOps work items
- PR descriptions
- investigation notes
- verification notes
- shared guidance files
- reusable prompt files

Do not leave important work state only in chat.
Use GitHub Copilot to improve continuity, not to excuse undocumented work.

--

## Final Rule

We use Copilot to accelerate disciplined engineering.

If AI makes us faster but less rigorous, we are using it incorrectly.
If AI makes us faster and more consistent, we are using it well.