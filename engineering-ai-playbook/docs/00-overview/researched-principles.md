# Researched Principles for AI-Assisted Engineering with Copilot

This document defines the operating principles for using GitHub Copilot across our engineering workflows.

It is based on:
- our actual team setup and architecture
- the internal AI coding guidelines we reviewed
- selected ideas from external Claude-oriented best-practice repositories
- deliberate adaptation for Copilot, Azure DevOps, Visual Studio, and VS Code

This is not a generic AI advice document. It is the baseline standard for how our team should use AI tools in day-to-day engineering work.

---

## 1. Scope and Context

Our working environment:
- Microservice architecture
- Each microservice in a separate repository
- Azure DevOps for repositories, work items, and delivery workflows
- Backend development mainly in Visual Studio
- Frontend development mainly in VS Code
- Backend stack includes .NET Core and .NET Framework applications
- APIs follow our existing .NET Core Web API toolkit patterns
- Frontend is Angular
- Frontend uses a custom theme and layout primitives such as `.grid`
- SQL is heavily used
- Couchbase is used in some systems
- Entity Framework is used for regular data access
- Complex or performance-sensitive queries are often implemented with stored procedures
- Team includes both Developers and QA engineers

These principles must respect that environment. AI usage should strengthen our existing engineering discipline, not replace it with generic patterns from other ecosystems.

---

## 2. Primary Position

We use Copilot as an engineering assistant, not as an autonomous decision-maker.

Copilot should help us:
- plan work more clearly
- understand existing code faster
- draft code and tests faster
- review changes more rigorously
- identify risks earlier
- improve consistency in implementation and verification

Copilot should not:
- silently redefine architecture
- replace engineering judgment
- bypass review and verification
- invent new patterns when good existing ones already exist
- be trusted without evidence

---

## 3. Core Principles

### 3.1 Correctness over cleverness
Prefer simple, readable, maintainable solutions over impressive or overly abstract ones.

AI-generated code must be judged by:
- clarity
- correctness
- maintainability
- fit with the existing codebase

Not by novelty.

### 3.2 Smallest safe change
Default to the smallest change that solves the problem safely.

Do not expand scope unless the expanded change clearly reduces risk or complexity.
Do not refactor adjacent code just because Copilot can see a cleaner design.

### 3.3 Existing patterns win
Before adding new structures, follow:
- existing service patterns
- existing toolkit conventions
- existing error handling
- existing test styles
- existing Angular theme and layout usage
- existing database access conventions

The codebase is the primary source of truth for implementation style.

### 3.4 Verification is part of the task
A task is not complete when code is written.
A task is complete when the change is verified with evidence.

Verification may include:
- tests
- build success
- linting or static analysis
- manual reproduction
- visual confirmation
- API contract checks
- database behavior validation
- regression checks

### 3.5 Be explicit about uncertainty
If something cannot be verified, that must be stated clearly.

The expected behavior is:
- say what is known
- say what is assumed
- say what remains unverified
- propose the safest next verification step

### 3.6 Preserve intentional architecture
The following should be treated as intentional unless the task explicitly says otherwise:
- our .NET API toolkit patterns
- our Angular custom theme and primitives
- Entity Framework usage patterns
- stored procedures for complex or performance-sensitive queries
- service boundaries and existing contracts
- chosen use of SQL or Couchbase in a service

AI must not treat these as accidental legacy choices.

---

## 4. How We Use Copilot

### 4.1 Copilot is a guided assistant
We use Copilot through:
- Copilot Chat in Visual Studio for backend work
- Copilot Chat in VS Code for frontend work
- optional Copilot CLI where it improves planning or review
- repository-local instructions and reusable prompt files

We do not assume GitHub-hosted autonomous agent workflows, because our repositories are in Azure DevOps.

### 4.2 Prompting should be specific
Good prompts are:
- task-specific
- grounded in the repository
- constrained by acceptance criteria
- explicit about verification
- explicit about what must not change

Weak prompts are:
- vague
- broad
- architecture-neutral
- missing context
- missing risk boundaries

### 4.3 Plan first for non-trivial work
Use plan-first behavior for:
- multi-file changes
- architecture-sensitive changes
- API changes
- database-impacting changes
- UI behavior changes
- bug fixes with unclear root cause
- changes with production risk

A good plan includes:
- goal
- affected areas
- likely risks
- verification strategy
- what will not be changed

### 4.4 Ask questions before writing code
Before implementation, Copilot should be used to answer questions such as:
- where is the existing pattern for this?
- what is the current contract?
- what already handles similar behavior?
- what tests already exist?
- what is the likely risk boundary?

Codebase understanding should come before code generation.

### 4.5 Prefer thin vertical slices
Large AI-generated changes are harder to trust and harder to review.

Prefer:
- small increments
- one risk at a time
- implement → verify → expand

This is especially important in microservices, where unintended side effects can cross contracts and environments.

---

## 5. Principles for Backend Development

### 5.1 Respect service contracts
Copilot should not change public behavior casually.

Any change affecting:
- request or response shapes
- status codes
- validation behavior
- serialization
- error contracts
- event/message payloads

must be treated as contract-sensitive.

### 5.2 Follow existing toolkit patterns
For backend work, Copilot output should align with:
- our Web API toolkit conventions
- existing controller or endpoint structure
- existing dependency injection patterns
- existing validation and exception handling
- existing logging and telemetry patterns

### 5.3 Use Entity Framework intentionally
For normal CRUD and standard queries, follow existing Entity Framework patterns.

Do not allow Copilot to:
- rewrite working EF data access into a different pattern without cause
- introduce inconsistent query styles across similar services
- hide inefficient queries behind abstraction

### 5.4 Treat stored procedures as first-class architecture
Stored procedures are not a smell by default.

Where they are already used for:
- complexity
- performance
- stable operational behavior

Copilot should preserve that architecture unless a task explicitly requires redesign.

For changes touching stored procedures, verification should include:
- parameter behavior
- result shape
- null and edge cases
- performance considerations where relevant
- compatibility with consuming code

### 5.5 SQL and Couchbase boundaries require extra care
Database boundary changes must be reviewed more carefully than ordinary refactors.

Copilot should not:
- move data access between SQL and Couchbase casually
- replace established storage logic without explicit intent
- assume parity between persistence models

---

## 6. Principles for Frontend Development

### 6.1 Theme and layout standards are mandatory
Our Angular custom theme and layout primitives are part of our engineering standard.

Copilot should prefer:
- existing theme abstractions
- existing layout utilities such as `.grid`
- existing responsive conventions
- existing components and shared UI patterns

It should avoid:
- ad hoc CSS when an approved abstraction already exists
- inconsistent responsive behavior
- one-off layout fixes that bypass our system

### 6.2 UI verification is not optional
Frontend work must be verified visually and behaviorally.

Verification may include:
- layout on relevant screen sizes
- focus behavior
- keyboard navigation
- accessibility basics
- error and empty states
- consistency with existing theme behavior

### 6.3 Frontend prompts should be UI-specific
When using Copilot on frontend work, prompts should specify:
- the screen or component
- the expected user behavior
- constraints from the theme/design system
- responsive expectations
- what should remain unchanged

---

## 7. Principles for QA

### 7.1 QA should use AI for precision, not for guesswork
AI should help QA:
- sharpen bug reports
- improve repro steps
- propose regression coverage
- review acceptance criteria
- identify missing edge cases
- assess risk areas in a PR

AI should not replace test thinking.

### 7.2 Bug reports should be stronger before implementation starts
A good AI-assisted bug report should include:
- repro steps
- expected behavior
- actual behavior
- affected service or screen
- environment or data conditions
- likely impact
- regression expectation

### 7.3 Regression thinking must be explicit
For bug fixes, QA and developers should both ask:
- what test would have caught this?
- what similar flows are now at risk?
- what contract or assumption failed?
- how will we know this stays fixed?

### 7.4 PR verification should be evidence-based
QA review should not stop at “it looks good.”
It should include:
- observed behavior
- validation notes
- edge case checks
- regression concerns
- open uncertainty where verification could not be completed

---

## 8. Definition of Done Principles

A change is only done when all applicable criteria are satisfied.

Done usually means:
- the implementation matches the requested outcome
- existing architecture and patterns were respected
- risks were identified and contained
- verification was performed
- evidence exists
- the change is understandable in review
- no hidden scope expansion was introduced

For many tasks, done should also include:
- automated tests added or updated
- build passes
- linting or static checks pass
- manual validation completed
- regression risk reviewed

---

## 9. Safe AI Workflow

### 9.1 Standard workflow
Our default AI-assisted workflow is:

1. Understand the task
2. Ask codebase questions
3. Create a small plan
4. Identify risk boundaries
5. Implement the smallest safe change
6. Verify with evidence
7. Review for simplicity and compatibility
8. Document any important lessons

### 9.2 Bug-fix workflow
For bug work, the preferred sequence is:

1. Reproduce
2. Localize the failure
3. Identify root cause
4. Fix the root cause
5. Add regression coverage where appropriate
6. Verify the original scenario
7. Review nearby risks without widening scope unnecessarily

### 9.3 PR review workflow
When reviewing AI-assisted work, check:
- does it solve the stated problem?
- does it preserve existing patterns?
- is the scope controlled?
- is the code simpler or more fragile?
- is the verification story credible?
- would a strong reviewer approve this diff?

---

## 10. What We Adopt from the External Research

### 10.1 We adopt these ideas strongly
- plan first for non-trivial work
- use AI for codebase Q&A before implementation
- prefer thin vertical slices
- verify before declaring success
- preserve existing patterns
- use focused, reusable prompts
- keep instructions short and durable
- simplify AI-generated code when it becomes too clever
- parallelize only independent work
- make review and evidence explicit

### 10.2 We adopt these ideas selectively
- isolated parallel workstreams
- reusable prompt libraries
- advanced planning structures such as Research → Plan → Implement
- visual verification as a debugging aid
- cross-checking outputs with alternative reasoning paths

These are useful, but only when they reduce risk or improve clarity.

### 10.3 We do not adopt these ideas as defaults
- Claude-specific command systems
- Claude-specific agents, skills, hooks, and memory files
- complex multi-agent orchestration as the default workflow
- broad autonomy with weak review controls
- permissive tooling setups that reduce safety

Those patterns may be interesting in theory, but they are not our default operating model.

---

## 11. Tooling Principles

### 11.1 Repository-local instructions matter
Even in Azure DevOps repositories, we should maintain repository-local guidance for Copilot such as:
- `.github/copilot-instructions.md`
- path-specific instruction files
- reusable prompt files
- lightweight repo-local lessons

These files should contain stable guidance, not temporary task chatter.

### 11.2 Keep instructions short and durable
Instruction files should contain:
- repeated rules
- architecture guardrails
- verification expectations
- stable conventions

They should not contain:
- temporary task instructions
- long essays
- duplicated documentation
- stale preferences

### 11.3 Least privilege and safe automation
Do not normalize unsafe AI tooling behavior.

Preferred posture:
- narrow permissions
- explicit review
- controlled automation
- no secrets in prompts, code, or logs
- no destructive command approval without human intent

---

## 12. Communication Principles

When using AI in engineering work, the output should be:
- concise
- concrete
- evidence-based
- explicit about assumptions
- explicit about risks
- explicit about verification

A good summary of AI-assisted work should say:
- what changed
- why it changed
- what was verified
- what remains uncertain
- what should be reviewed carefully

---

## 13. Anti-Patterns

We should actively avoid:
- trusting Copilot output without verification
- broad prompts that invite scope creep
- AI-driven refactors with weak justification
- changing architecture accidentally
- bypassing our theme/toolkit conventions
- treating stored procedures as incidental
- mixing SQL and Couchbase patterns casually
- writing tests that only validate implementation details
- verbose AI-generated code that nobody wants to maintain
- using AI to create the appearance of progress without evidence

---

## 14. Final Working Rule

Use Copilot to accelerate disciplined engineering, not to bypass it.

The quality bar remains the same:
- clear problem understanding
- small safe changes
- respect for architecture
- explicit verification
- clean reviewability
- honest communication about uncertainty

If Copilot makes us faster but less rigorous, we are using it incorrectly.
If Copilot makes us faster and more consistent, we are using it well.