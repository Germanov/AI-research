# Developer Short Guidance

## Purpose

Use Copilot to speed up disciplined engineering, not to bypass it.

The goal is not to generate more code.  
The goal is to make safer decisions faster.

---

## Core Rules

### Plan first for non-trivial work
For anything beyond a small local edit, first clarify:
- what is changing
- what must not change
- what files or contracts are affected
- how you will verify the result

### Ask codebase questions before coding
Use Copilot to understand:
- existing patterns
- related implementations
- contract boundaries
- existing tests
- likely risk areas

Do not start with a vague “implement this” prompt.

### Make the smallest safe change
Prefer controlled, reviewable diffs over wide AI-generated rewrites.

Avoid:
- unrelated cleanup
- opportunistic refactors
- new abstractions without strong need

### Respect existing architecture
Treat the following as intentional unless the task says otherwise:
- service boundaries
- API toolkit patterns
- Angular theme and layout primitives
- Entity Framework usage patterns
- stored procedures for complex queries
- SQL versus Couchbase design choices

### Verify before claiming done
Do not trust generated code because it looks right.

Check with:
- tests
- build success
- manual validation
- contract checks
- visual verification where relevant

---

## Backend Rules

- Preserve API contracts unless the task explicitly changes them.
- Follow existing .NET and toolkit conventions.
- Treat stored procedures as first-class architecture, not accidental legacy.
- Be careful with EF query behavior, result shape, and performance impact.

---

## Frontend Rules

- Use existing Angular and shared UI patterns.
- Prefer the custom theme and approved helpers such as `.grid`.
- Do not bypass the design system with one-off CSS unless required.
- Verify responsive behavior and basic accessibility.

---

## Common Mistakes to Avoid

- Using broad prompts that create scope creep
- Accepting AI output without checking fit to the existing codebase
- Letting Copilot invent new architecture
- Making changes too large to review comfortably
- Confusing “implemented” with “verified”
- Leaving assumptions unstated

---

## What Good Looks Like

A strong AI-assisted change is:
- small
- clear
- aligned with existing patterns
- easy to review
- backed by verification
- honest about uncertainty

If the code is fast to generate but hard to trust, the workflow failed.
