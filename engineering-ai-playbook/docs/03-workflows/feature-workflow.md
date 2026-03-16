# Feature Workflow

## Purpose

This workflow defines how to deliver features using GitHub Copilot without weakening architecture, review quality, or verification discipline.

It is intended for backend and frontend feature work across our repositories.

---

## When to Use This Workflow

Use this workflow for:
- new feature implementation
- feature extensions
- moderate enhancements to existing behavior
- UI features
- API features
- service behavior additions
- work that is larger than a small bug fix

---

## Preconditions

Before implementation starts, the task should define as much of the following as possible:
- feature goal
- acceptance criteria
- affected area or service
- expected user or system behavior
- constraints
- non-goals
- dependencies
- known risks

If those are unclear, clarify them before coding.

---

## Step-by-Step Workflow

### 1. Understand the feature
Clarify:
- what problem is being solved
- who or what benefits from it
- what behavior must be added
- what must stay unchanged
- what the acceptance criteria really mean

Do not start implementation from a vague feature description.

### 2. Understand the existing pattern
Use Copilot and code reading to find:
- similar existing behavior
- reusable patterns
- related components or services
- contract boundaries
- relevant tests
- likely risk areas

### 3. Define the implementation boundary
State clearly:
- what is in scope
- what is out of scope
- what contracts must remain stable
- what layers will be touched
- what verification will be needed

This is how feature work avoids accidental scope creep.

### 4. Plan the smallest safe slice
Break the feature into the smallest reviewable vertical slice that provides useful progress.

A good slice usually includes:
- one coherent behavior change
- limited touched files
- clear verification path
- controlled reviewer impact

### 5. Implement in a controlled way
During implementation:
- reuse existing patterns
- keep changes narrow
- avoid unnecessary abstraction
- avoid unrelated cleanup
- preserve service and UI consistency
- keep the diff understandable

### 6. Add or update tests
Where appropriate, add or update:
- unit tests
- integration tests
- UI tests
- regression coverage
- manual validation notes for behavior that cannot be fully automated

### 7. Verify the behavior
Check:
- acceptance criteria
- edge cases relevant to the feature
- non-happy-path behavior
- compatibility with existing flows
- build and test health
- visual behavior where relevant
- contract stability where relevant

### 8. Review for fit and safety
Before PR review, check:
- does this feature fit the existing architecture?
- did we reuse existing patterns?
- did scope stay controlled?
- is the code simple enough to maintain?
- is the verification story strong enough?

### 9. Summarize clearly
Document:
- what was added
- why it was added
- what was intentionally left unchanged
- how it was verified
- what reviewers should focus on
- what risks remain, if any

---

## Verification and Evidence

Feature work needs evidence, not just code.

Useful evidence may include:
- tests
- build success
- screenshots
- behavior notes
- API examples
- manual walkthrough results
- notes on related scenarios checked

Weak evidence:
- “feature implemented”
- “works locally”

Strong evidence:
- “implemented [behavior], verified against [acceptance criteria], checked [related scenario], left [non-goal] unchanged”

---

## Exit Criteria

The workflow is complete when:
- the feature goal is implemented
- scope remained controlled
- existing patterns were respected
- verification is credible
- acceptance criteria are satisfied
- reviewers can understand what changed and why

---

## Common Failure Modes

- starting implementation before the behavior is clear
- mixing feature delivery with broad cleanup
- skipping codebase pattern discovery
- under-verifying edge cases
- changing contracts or UI behavior without calling it out
- over-engineering the first version
- using AI to generate too much code too early