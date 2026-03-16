# Backend Short Guidance

## Purpose

Use Copilot to help with backend delivery without weakening contract safety, service boundaries, or maintainability.

The priority is not speed alone.  
The priority is safe, reviewable backend changes.

---

## Core Rules

### Start with understanding
Before changing code, use Copilot to identify:
- the existing pattern for this kind of change
- the affected endpoint, handler, service, or background process
- the current contract and expected behavior
- the tests that already cover similar logic

Do not start with “rewrite this” or “implement the whole thing.”

### Preserve contracts by default
Assume public behavior must stay stable unless the task explicitly requires a change.

Be careful with:
- request and response shapes
- status codes
- validation behavior
- exception behavior
- serialization
- integration-facing payloads

### Follow the existing toolkit and service patterns
Prefer existing conventions for:
- endpoints and controllers
- dependency injection
- validation
- logging
- exception handling
- data access
- test structure

If the codebase already has a pattern, reuse it.

### Keep changes small
Backend AI output becomes risky when it:
- touches too many layers at once
- mixes bug fixes with refactors
- changes contracts and internals together
- introduces new abstractions too early

Prefer thin, reviewable changes.

### Verify with evidence
Backend work is not done until it is checked through the right verification path.

That may include:
- unit tests
- integration tests
- build success
- manual endpoint validation
- contract checks
- database verification

---

## Data Access Rules

### Use Entity Framework intentionally
For standard queries and CRUD operations, follow existing EF patterns.

Do not let Copilot:
- introduce inconsistent query styles
- hide inefficient behavior
- add complexity without reason

### Treat stored procedures as intentional
Stored procedures used for complex or performance-sensitive behavior are part of the architecture.

Do not treat them as accidental legacy code.

When touching stored procedure logic, verify:
- parameters
- result shape
- compatibility with consuming code
- null and edge cases
- performance-sensitive behavior where relevant

### Respect SQL and Couchbase boundaries
Do not casually move logic between SQL and Couchbase.
Do not assume they are interchangeable.
Preserve the storage decisions already made by the service unless redesign is explicit.

---

## Common Mistakes to Avoid

- Accepting broad AI-generated refactors
- Accidentally changing contracts while fixing internals
- Mixing multiple concerns into one diff
- Replacing working patterns with generic abstractions
- Under-verifying database-impacting changes
- Treating stored procedures as disposable

---

## What Good Looks Like

A strong backend change is:
- contract-aware
- aligned with service patterns
- small enough to review
- verified with evidence
- honest about risk and uncertainty

If a reviewer has to guess what changed at the boundary, the change is not ready.