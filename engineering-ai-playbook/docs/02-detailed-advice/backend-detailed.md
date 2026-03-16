# Backend Detailed Guidance

## Purpose

This document defines how backend engineers should use GitHub Copilot in our environment.

The goal is to accelerate backend delivery without weakening:
- service boundaries
- API contracts
- data correctness
- maintainability
- review quality
- production safety

These guidelines apply to backend work in Visual Studio across our microservice repositories.

---

## 1. Core Position

Copilot is a backend assistant, not a backend architect.

Use it to:
- understand existing code faster
- locate similar implementations
- draft focused changes
- generate test scaffolding
- summarize risks and verification steps
- improve reviewability

Do not use it to:
- redesign service structure by default
- replace careful contract thinking
- make data-layer assumptions without validation
- generate large cross-cutting changes with weak justification
- hide uncertainty behind confident wording

In backend work, wrong but plausible code is often more dangerous than obviously broken code.  
That is why verification and architectural fit matter as much as implementation speed.

---

## 2. Default Backend Working Model

The default backend workflow is:

1. Understand the task
2. Understand the existing implementation and surrounding pattern
3. Identify the contract and risk boundaries
4. Plan the smallest safe change
5. Implement in a controlled slice
6. Verify behavior with evidence
7. Review for clarity, compatibility, and production risk

This matters especially in our environment because:
- services are split across repositories
- public and internal contracts matter
- persistence choices are intentional
- multiple technologies coexist across services
- AI can widen scope faster than humans notice

---

## 3. Codebase Alignment Comes Before Code Generation

Before asking Copilot to write backend code, use it to understand the codebase.

Questions to ask first:
- Where is the existing pattern for this behavior?
- Which handler, controller, service, or job already does something similar?
- What current request and response contracts are involved?
- Which validations or business rules already apply?
- Which tests already cover similar logic?
- What persistence layer is involved?
- What should explicitly remain unchanged?

This is the difference between codebase-aware help and generic code generation.

### Strong prompts
- “Show the existing pattern for validation in this service.”
- “Find where similar response mapping is done.”
- “Which tests cover this endpoint today?”
- “Where is the current authorization logic for this flow?”
- “What existing repository or service handles comparable behavior?”

### Weak prompts
- “Implement this whole backend task.”
- “Refactor this to make it cleaner.”
- “Rewrite this with best practices.”
- “Modernize this code.”

Generic prompts produce generic results. Backend work needs context-sensitive output.

---

## 4. Contracts Are the First Risk Boundary

In backend engineering, contract safety is one of the main review axes.

Changes should be treated as contract-sensitive when they affect:
- request shape
- response shape
- status codes
- validation rules
- exception behavior
- serialization behavior
- pagination, ordering, or filtering semantics
- integration payloads
- job/event/message schemas

Copilot should not be trusted to preserve contracts automatically.  
The developer must define the boundary explicitly and review it carefully.

### Good practice
When prompting Copilot, state:
- what contract must stay stable
- what input/output behavior must remain unchanged
- what is allowed to change internally
- what evidence will be needed to prove safety

### Example
Good:
- “Fix the null-handling bug without changing response shape, status codes, or validation behavior.”

Weak:
- “Fix this endpoint.”

The more explicit the contract boundary, the safer the AI-assisted change.

---

## 5. Prefer the Smallest Safe Change

Backend changes should be narrow unless broader change is explicitly justified.

Prefer:
- local fixes over system-wide rewrites
- targeted improvements over generalized abstraction
- one contract-sensitive change at a time
- implementation changes separated from cleanup

Avoid:
- mixing bug fix + refactor + naming cleanup + architectural change in one PR
- rewriting shared code during an urgent defect fix
- introducing new layers to solve a one-layer problem
- widening database behavior and API behavior in the same diff unless necessary

### Why this matters
Small backend changes are easier to:
- reason about
- test
- explain
- review
- rollback safely

AI makes broad change easy. That is not the same as safe.

---

## 6. Follow Existing Toolkit and Service Patterns

Our services already have established conventions. Copilot must align with them.

Prefer the current repository conventions for:
- endpoint/controller layout
- service and handler structure
- dependency injection
- validation
- exception handling
- logging
- telemetry
- configuration access
- mapping
- test organization

Consistency across services is usually more valuable than a locally elegant alternative.

### Rule of thumb
If the codebase already has a stable pattern, reuse it unless the task explicitly says otherwise.

---

## 7. Data Access Principles

### 7.1 Entity Framework is for normal access patterns
Entity Framework is appropriate for ordinary data access, CRUD flows, and standard query logic where the service already uses it.

When reviewing EF code generated or modified with Copilot, check:
- query shape
- filtering correctness
- projection correctness
- null handling
- ordering assumptions
- lazy/eager loading implications
- multiple-query risks
- mapping behavior
- performance-sensitive paths

Compilation is not proof of correctness.

### 7.2 Stored procedures are intentional architecture
Stored procedures used for complex or performance-sensitive logic should be treated as first-class design choices.

Do not let Copilot:
- replace them casually
- route around them with ad hoc logic
- duplicate their behavior outside the intended boundary
- simplify them away conceptually just because the surrounding code looks more modern

When touching stored-procedure-related behavior, verify:
- parameter expectations
- output schema
- compatibility with consuming code
- empty or edge-case results
- behavior under realistic data
- performance-sensitive assumptions where relevant

### 7.3 SQL and Couchbase are not interchangeable
Where a service uses SQL versus Couchbase, that decision should be treated as deliberate unless redesign is explicit.

Copilot should not casually:
- migrate logic from one persistence model to another
- flatten differences in query or shape semantics
- assume missing values behave the same way
- assume consistency and indexing behavior match

Developers should review carefully for:
- document shape assumptions
- null vs missing field behavior
- query semantics
- serialization assumptions
- key handling
- consistency expectations
- result-shape compatibility

---

## 8. Backend Bug Fixing Guidance

Backend bug fixing should follow this sequence:

1. Reproduce or establish credible evidence
2. Define expected behavior clearly
3. Localize the failing layer
4. Identify root cause
5. Plan the smallest safe fix
6. Add or update regression coverage where appropriate
7. Verify original and related risk scenarios

### Common backend bug-fix mistake
Fixing the visible symptom while missing the actual broken assumption.

Copilot is helpful for:
- surfacing similar code paths
- finding likely sources of the assumption
- showing related tests
- summarizing risk areas

It is not enough to say “Copilot found the fix.”  
The fix must still be explained and verified.

---

## 9. Test and Verification Expectations

Backend work is not complete when the code compiles.

Expected verification depends on risk, but may include:
- unit tests
- integration tests
- endpoint checks
- contract validation
- build success
- static analysis or linting where applicable
- data-layer verification
- manual confirmation of the original scenario

### For contract-sensitive changes
Expect stronger verification:
- request examples
- response examples
- status code checks
- validation behavior checks
- serialization checks
- consumer compatibility review

### For data-sensitive changes
Expect stronger verification:
- correct result shape
- empty-result behavior
- null handling
- ordering/filtering correctness
- stored procedure compatibility
- downstream consumer impact review

Verification notes should be specific enough for QA or another engineer to follow.

---

## 10. Review AI Output Aggressively

Copilot can produce backend code that is:
- plausible
- fast
- syntactically correct
- structurally complete

That does not mean it is a good fit.

Review generated code for:
- hidden contract drift
- unnecessary abstraction
- duplicated logic
- poor naming
- overly defensive or inconsistent error handling
- accidental changes in semantics
- unnecessary broadening of scope
- poor data access assumptions

Useful follow-up prompts:
- “Show the smallest safe version of this change.”
- “Simplify this without changing behavior.”
- “Align this with the pattern used in [file/class].”
- “What assumptions is this implementation making?”
- “Which parts of this are actually required?”

---

## 11. PR Communication for Backend Work

A good backend PR summary should state:
- what changed
- why it changed
- which contract boundaries were considered
- which layers were intentionally not changed
- how behavior was verified
- where reviewers should focus
- what remains uncertain, if anything

Examples of useful reviewer callouts:
- contract-sensitive changes
- stored procedure changes
- consumer-impact risk
- authorization or validation changes
- behavior that could not be fully verified locally

Do not make reviewers infer the risk from the diff alone.

---

## 12. Common Anti-Patterns

Avoid:
- prompting Copilot without naming the affected contract
- using AI to generate broad backend rewrites
- changing internals and public behavior together without calling it out
- trusting generated EF queries without inspecting semantics
- treating stored procedures as incidental legacy
- weakening consistency by introducing one-off patterns
- accepting verbose AI code because it seems thorough
- confusing build success with behavioral correctness

---

## 13. What Good Looks Like

A strong backend AI-assisted change is:
- contract-aware
- small enough to review
- aligned with existing service patterns
- careful about persistence boundaries
- verified with evidence
- clearly explained to reviewers and QA

If a reviewer cannot quickly tell what changed at the boundary and why it is safe, the backend change is not ready.