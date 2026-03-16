# Developer Detailed Guidance

## Purpose

This document defines how developers should use GitHub Copilot in our engineering environment.

The goal is not to generate code faster at any cost.  
The goal is to improve delivery speed while preserving correctness, maintainability, architectural consistency, and review quality.

These guidelines apply to:
- backend development in Visual Studio
- frontend development in VS Code
- microservice repositories in Azure DevOps
- AI-assisted implementation, debugging, refactoring, and review

---

## 1. How Developers Should Think About Copilot

Copilot is an assistant, not an authority.

Use it to:
- understand existing code faster
- draft implementation options
- identify related files and patterns
- generate test scaffolding
- improve review quality
- help structure investigation and verification

Do not use it to:
- make architectural decisions by default
- replace code reading
- bypass debugging discipline
- justify risky changes with weak evidence
- hide uncertainty behind polished output

A good developer uses Copilot to reduce mechanical effort and increase clarity.  
A weak workflow uses Copilot to create the illusion of progress without proof.

---

## 2. Default Working Model

Our default working model is:

1. Understand the task
2. Understand the existing code
3. Plan the smallest safe change
4. Implement in a controlled slice
5. Verify with evidence
6. Review for simplicity, compatibility, and risk
7. Document what matters for reviewers and QA

This model is especially important in our environment because:
- services are split across repositories
- backend contracts matter
- data access patterns are intentional
- UI consistency is important
- Azure DevOps is our workflow system
- AI-generated changes can become wider than intended very quickly

---

## 3. Start With Codebase Understanding, Not Code Generation

Before using Copilot to generate code, use it to answer questions.

Typical questions:
- Where is the existing pattern for this type of change?
- Which service, endpoint, component, or module already does something similar?
- What are the contract boundaries here?
- What tests already cover similar behavior?
- What code is likely to be affected?
- What assumptions does this implementation rely on?

This matters because generic AI output is usually weaker than codebase-aligned output.

### Good use of Copilot
- “Show me the existing pattern for validation in this service.”
- “Where do we already map this response shape?”
- “Which component handles similar responsive behavior?”
- “What tests already cover this API path?”

### Weak use of Copilot
- “Implement this entire feature.”
- “Rewrite this cleanly.”
- “Modernize this code.”
- “Refactor this whole area.”

The weaker the prompt, the higher the risk of drift from the codebase.

---

## 4. Plan First for Non-Trivial Work

For non-trivial changes, do not jump directly into implementation.

Non-trivial means:
- multiple files
- multiple layers
- public API changes
- UI behavior changes
- database-impacting work
- unclear bug root cause
- anything with moderate or high production risk

Before coding, establish:
- what is changing
- what must not change
- which files or layers are involved
- which contract boundaries matter
- how the result will be verified
- what risks deserve reviewer attention

### Practical planning questions
- What is the smallest version of this change that solves the problem?
- Can this be done in one reviewable slice?
- Is this a contract-sensitive change?
- Is this touching SQL, stored procedures, or persistence boundaries?
- Is this affecting a shared Angular component or theme behavior?
- What should QA verify after implementation?

A plan should reduce risk, not create paperwork.  
If the plan is vague, the implementation will usually be worse.

---

## 5. Prefer the Smallest Safe Change

One of the most important engineering rules for AI-assisted work is to prefer the smallest safe change.

This means:
- solving the stated problem directly
- not widening scope without reason
- not mixing bug fixes with cleanup
- not introducing new abstractions unless necessary
- not rewriting a working area because the generated version looks cleaner

### Why this matters
Copilot is very good at producing plausible code across a broad surface area.
That is useful for exploration, but dangerous for delivery.

Small changes are easier to:
- reason about
- verify
- review
- rollback
- explain to QA

If a diff is hard to explain in one paragraph, it is often too large.

---

## 6. Respect Existing Architecture and Standards

Developers must treat current architectural choices as intentional unless the task explicitly says otherwise.

That includes:
- service boundaries
- our .NET Core Web API toolkit patterns
- current dependency injection style
- current validation and exception handling
- existing logging and telemetry approach
- Angular shared UI patterns
- our custom theme and primitives such as `.grid`
- Entity Framework usage patterns
- stored procedures for complex or performance-sensitive work
- SQL versus Couchbase storage choices

### What this means in practice
Do not let Copilot:
- invent a parallel pattern beside an existing one
- replace a stable toolkit convention with a generic pattern
- turn stored procedure logic into ad hoc EF queries without intent
- replace theme abstractions with one-off CSS
- move logic across service boundaries casually

Good engineering with AI means making the codebase more consistent, not more fragmented.

---

## 7. Backend Guidance

### 7.1 Contracts come first
Backend changes must be reviewed through the lens of contracts.

Be careful with:
- request models
- response models
- validation behavior
- status codes
- serialization
- error behavior
- integration payloads
- background job behavior
- event or message schemas

Copilot should not be asked to make broad backend changes without explicit contract constraints.

### 7.2 Follow the existing service pattern
When implementing backend changes:
- reuse the current endpoint/controller style
- follow existing handler/service organization
- reuse validation patterns
- follow current logging practices
- stay consistent with existing test structure

Even if a different structure could work, consistency is usually more valuable than local cleverness.

### 7.3 Use EF deliberately
Entity Framework is the default path for ordinary data access, but it should be used with awareness.

Developers should review generated EF code for:
- query shape
- filtering correctness
- materialization behavior
- accidental multiple queries
- null handling
- ordering assumptions
- mapping correctness

Never assume a generated query is safe because it compiles.

### 7.4 Treat stored procedures as first-class
Stored procedures are part of the architecture where they already exist.

Do not let Copilot implicitly argue against them by generating alternate logic unless the task is specifically about redesign.

When changing stored-procedure-related behavior, review:
- input parameters
- output schema
- edge-case behavior
- consumer compatibility
- transaction/timeout implications where relevant

### 7.5 SQL and Couchbase are different risk surfaces
Do not treat SQL and Couchbase as interchangeable persistence choices.

Review generated code carefully when it touches:
- document shape assumptions
- key structure
- serialization
- query semantics
- null/missing-field behavior
- indexing assumptions
- consistency assumptions

AI output often smooths over these differences too casually.

---

## 8. Frontend Guidance

### 8.1 Start from the design system
Frontend work should start with what already exists in the repo:
- shared components
- existing screen patterns
- theme conventions
- responsive layout helpers
- validation and feedback patterns

Our custom theme and layout primitives are part of how we enforce consistency.  
They should be treated as engineering infrastructure, not optional convenience.

### 8.2 Avoid one-off UI solutions
Do not let Copilot introduce:
- isolated CSS fixes when a theme abstraction exists
- inconsistent spacing/layout patterns
- ad hoc responsiveness
- component-specific behavior that conflicts with shared UX rules

A frontend change is not good just because it renders correctly once.

### 8.3 Define behavior explicitly
When prompting Copilot for frontend work, specify:
- what the user should see
- what the user should be able to do
- what should happen in loading, empty, and error states
- what must remain unchanged
- what responsive behavior is required

Weak UI prompts produce vague UI behavior.

### 8.4 Verify visually and behaviorally
Frontend verification must include:
- rendered state
- relevant screen sizes
- validation behavior
- empty and error states
- interactions
- focus behavior where relevant
- consistency with the theme and surrounding screens

Do not accept frontend output based only on code appearance.

---

## 9. Use Copilot Well in Visual Studio and VS Code

### In Visual Studio
Use Copilot for:
- codebase Q&A
- exploring similar implementations
- drafting focused backend changes
- generating or refining tests
- reviewing local diffs
- summarizing risk and verification notes

Be especially careful with:
- generated backend abstractions
- hidden contract changes
- data access code
- verbose error handling
- over-abstracted service logic

### In VS Code
Use Copilot for:
- frontend behavior clarification
- component-level implementation
- test scaffolding
- review of template/style changes
- cross-checking UI logic with intended behavior
- summarizing verification expectations

Be especially careful with:
- CSS bypassing the theme
- verbose or over-engineered component logic
- duplicated UI patterns
- superficially correct but inconsistent layout behavior

---

## 10. Verification Is Part of Implementation

A developer task is not complete when the code compiles.

Verification should match risk.

### Common verification methods
- unit tests
- integration tests
- build success
- manual endpoint checks
- manual UI checks
- contract verification
- screenshot or behavior confirmation where useful
- database validation for data-impacting changes

### Questions to ask
- Did I verify the intended behavior, or only the code path?
- Did I check the boundary that matters?
- Did I test only the happy path?
- If QA asked how I know this works, what evidence would I give?

“Should work” is not acceptable evidence.

---

## 11. Review AI Output Aggressively

Copilot output should be reviewed with the same discipline as junior-to-mid-level engineer output: sometimes very useful, often fast, but not automatically well-judged.

Check for:
- unnecessary abstraction
- unnecessary verbosity
- hidden scope expansion
- poor naming
- duplicated logic
- weakened readability
- unverified assumptions
- inconsistent use of existing patterns

One of the best uses of Copilot is asking it to simplify its own output after the first draft.

Useful follow-up prompts:
- “Simplify this without changing behavior.”
- “Align this with the existing pattern in [file/class/component].”
- “Explain which parts of this are actually necessary.”
- “Show the smallest safe version of this change.”

---

## 12. Communicate Clearly in PRs and Handoffs

AI-assisted work often fails at communication, not just code quality.

A good PR summary should say:
- what changed
- why it changed
- what was intentionally left unchanged
- how it was verified
- where reviewers should focus
- what remains uncertain, if anything

Do not make reviewers reconstruct intent from the diff.

Good communication reduces review time and improves QA effectiveness.

---

## 13. Common Anti-Patterns

Avoid:
- broad prompts that invite architecture drift
- accepting generated code because it is fast
- hiding weak verification behind polished summaries
- mixing bug fixes, refactors, and cleanup in one change
- rewriting working code to match AI preferences
- treating theme/toolkit/storage conventions as negotiable by default
- trusting generated tests without reading what they actually prove
- shipping code that no one can explain clearly

---

## 14. What Good Looks Like

A strong AI-assisted developer workflow produces changes that are:
- small
- clear
- codebase-aligned
- properly verified
- easy to review
- honest about uncertainty

A strong developer uses Copilot to improve judgment and execution quality.  
A weak workflow uses Copilot to reduce friction while also reducing discipline.

The quality bar does not change because AI is involved.