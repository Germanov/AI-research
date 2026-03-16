# PR Review Workflow

## Purpose

This workflow defines how to review pull requests consistently, especially when AI tools such as Copilot were used during implementation.

The goal of review is not just to approve code.  
The goal is to confirm that the change is correct, controlled, understandable, and properly verified.

---

## When to Use This Workflow

Use this workflow for:
- backend pull requests
- frontend pull requests
- bug fixes
- feature work
- refactoring
- test changes
- database-impacting changes
- AI-assisted implementation and review

Apply the workflow proportionally to the risk of the change.

---

## Preconditions

Before reviewing, the reviewer should have access to:
- the PR description or work summary
- the original task, bug, or story
- acceptance criteria or expected behavior
- test results or verification notes
- any screenshots, logs, or evidence relevant to the change

If the change cannot be reviewed meaningfully because context is missing, request the missing context first.

---

## Step-by-Step Workflow

### 1. Confirm the problem being solved
Before reading the diff in detail, confirm:
- what problem this PR is solving
- what behavior is expected
- what constraints apply
- what is intentionally out of scope

If the problem statement is unclear, the review will be weaker.

### 2. Check scope discipline
Review whether the change is appropriately scoped.

Ask:
- is this the smallest reasonable change?
- does the diff include unrelated cleanup?
- are multiple concerns mixed together?
- was there accidental scope expansion?

Large or unfocused diffs deserve extra scrutiny.

### 3. Check fit with existing patterns
Review whether the change aligns with the repository and architecture.

Look for fit with:
- existing backend patterns
- existing Angular patterns
- existing API toolkit conventions
- existing validation, logging, and exception handling
- existing theme and layout primitives
- existing test style
- existing data access patterns

The PR should look like it belongs in this codebase.

### 4. Review contracts and boundaries
Check whether the PR touches:
- request or response contracts
- validation rules
- status codes
- error behavior
- stored procedure behavior
- database result shape
- event or message payloads
- UI behavior at user-facing boundaries

If a contract changed, it must be intentional, explained, and verified.

### 5. Review implementation quality
Check whether the implementation is:
- readable
- maintainable
- appropriately simple
- consistent with nearby code
- free from unnecessary abstractions

AI-assisted code often needs simplification.
If the code is technically correct but unnecessarily complex, request a cleaner version.

### 6. Review risk areas
Review whether the PR touches areas that require extra caution:
- authentication or authorization
- persistence logic
- SQL or stored procedures
- Couchbase access
- cross-service integration
- configuration-sensitive behavior
- shared UI components
- theme/layout behavior
- accessibility-sensitive interactions

Higher-risk changes require stronger evidence.

### 7. Review tests and verification
Check whether verification matches the risk of the change.

Look for:
- tests added or updated where appropriate
- relevant existing tests passing
- build success
- manual validation where automation is insufficient
- UI screenshots or behavior notes where useful
- regression checks for related flows
- explicit note of anything not verified

Do not confuse confidence with evidence.

### 8. Review communication quality
The PR should clearly explain:
- what changed
- why it changed
- how it was verified
- where reviewers should pay extra attention
- what uncertainty remains, if any

If the summary is weak, request a clearer explanation.

### 9. Decide the review outcome
Choose the outcome based on evidence and risk:
- approve when the change is clear, safe, and verified
- request changes when the risk, clarity, or verification is insufficient
- ask questions when intent or behavior is still unclear

Do not approve because the code “looks fine.”

---

## Verification and Evidence

A strong PR includes credible evidence proportional to risk.

Examples of strong evidence:
- tests directly related to the changed behavior
- build success
- manual verification against the original repro or acceptance criteria
- API contract checks
- screenshots or UI validation notes
- database verification notes for SQL or stored procedure changes
- explanation of regression coverage

Examples of weak evidence:
- “works locally”
- “should be fine”
- “Copilot suggested this fix”
- no explanation for unverified areas

---

## Exit Criteria

A PR is ready to approve when:
- the problem being solved is clear
- the scope is controlled
- the implementation fits the codebase
- contracts and risk boundaries are respected
- verification is specific and credible
- the reviewer can understand both the change and its safety

If a reviewer would struggle to explain the change and its evidence to someone else, the PR is not ready.

---

## Common Failure Modes

- Reviewing the diff without understanding the original problem
- Missing accidental scope expansion
- Accepting AI-generated complexity because it appears complete
- Overlooking contract changes hidden inside implementation details
- Under-reviewing database or integration changes
- Treating screenshots or summaries as a substitute for verification
- Approving without enough evidence because the change is small
- Failing to request clarification when the PR description is weak