# Definition of Done

This checklist defines the minimum quality bar for work completed with or without AI assistance.

A task is not done because code was written.  
A task is done when the requested outcome is implemented, verified, reviewable, and safe to ship.

---

## Scope

Use this checklist for:
- backend changes
- frontend changes
- bug fixes
- feature work
- refactoring
- QA verification
- AI-assisted implementation and review

Apply only the sections relevant to the specific task.

---

## Core Done Criteria

- [ ] The change solves the stated problem or implements the requested behavior.
- [ ] The scope of the change is controlled and does not include unrelated refactoring.
- [ ] Existing architecture and project conventions were respected.
- [ ] The implementation is understandable and maintainable.
- [ ] Any risks, assumptions, or uncertainties are stated clearly.

---

## Implementation Checks

- [ ] The smallest safe change was made.
- [ ] Existing patterns were reused before introducing new abstractions.
- [ ] Public contracts were preserved unless the task explicitly required changing them.
- [ ] Error handling, logging, validation, and dependency usage follow existing service or UI patterns.
- [ ] AI-generated code was reviewed and simplified where necessary.

---

## Verification Checks

- [ ] Relevant automated tests were added or updated where appropriate.
- [ ] Existing automated tests pass.
- [ ] The project builds successfully.
- [ ] Linting, static analysis, or equivalent checks pass where applicable.
- [ ] The changed behavior was verified manually when automation alone is not enough.
- [ ] The original issue, story, or acceptance criteria were checked against the final result.

---

## Backend-Specific Checks

Apply when relevant.

- [ ] API request and response behavior were preserved or explicitly updated.
- [ ] Status codes, validation behavior, and error contracts were reviewed.
- [ ] Entity Framework usage follows existing patterns.
- [ ] Database changes were verified against expected behavior.
- [ ] Stored procedure changes were validated for parameter behavior, result shape, and compatibility.
- [ ] SQL and Couchbase usage remains consistent with the service design.

---

## Frontend-Specific Checks

Apply when relevant.

- [ ] Existing Angular patterns and shared components were reused.
- [ ] The custom theme and approved layout primitives such as `.grid` were used correctly.
- [ ] The UI works on relevant screen sizes.
- [ ] Visual behavior, empty states, and error states were checked.
- [ ] Basic accessibility expectations were reviewed, including focus and keyboard behavior where relevant.

---

## QA Checks

Apply when relevant.

- [ ] Reproduction steps were validated against the final change.
- [ ] Expected versus actual behavior is now clear and correct.
- [ ] Regression risk was considered.
- [ ] Related flows or edge cases were checked where appropriate.
- [ ] Verification evidence is recorded clearly enough for another team member to understand what was tested.

---

## Risk Checks

- [ ] No accidental architecture changes were introduced.
- [ ] No sensitive configuration, secrets, or unsafe automation behavior were introduced.
- [ ] Risky shortcuts were avoided.
- [ ] If something could not be verified, that is explicitly documented.

---

## Review Readiness

- [ ] The change is small enough and clear enough to review effectively.
- [ ] The PR or work summary explains what changed and why.
- [ ] The verification story is credible and specific.
- [ ] Any areas needing extra reviewer attention are called out.

---

## Final Rule

A task is done only when a strong reviewer can understand:
- what changed
- why it changed
- how it was verified
- what risks remain, if any

If those answers are unclear, the work is not done yet.