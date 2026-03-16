# QA Regression Workflow

## Purpose

This workflow defines how to approach regression checking in a structured way after a bug fix, feature change, refactor, or contract-sensitive update.

It is designed to help QA and developers use GitHub Copilot to improve regression thinking without replacing evidence-based verification.

---

## When to Use This Workflow

Use this workflow for:
- bug fixes
- feature changes that affect existing behavior
- backend changes with contract risk
- frontend changes with UI consistency risk
- SQL or stored procedure changes
- Couchbase or document-shape-sensitive changes
- refactors that may affect adjacent flows

---

## Preconditions

Before starting regression verification, gather:
- the original issue, task, or PR summary
- expected behavior
- the implemented change summary
- known risk areas
- related screens, endpoints, or services
- existing tests or verification notes
- screenshots, logs, payload examples, or repro steps if available

If the expected behavior is unclear, clarify it before proceeding.

---

## Step-by-Step Workflow

### 1. Confirm the primary change
Start by stating:
- what changed
- why it changed
- which user, API, or data behavior was affected
- what was intentionally not changed

Do not start regression work from code alone without understanding the intended behavior.

### 2. Identify the regression surface
Ask:
- what nearby flows share the same code path?
- what contracts could be affected?
- what other states use the same logic?
- what similar components or endpoints may be indirectly impacted?
- what data assumptions might have changed?

Typical regression surfaces include:
- sibling endpoints
- related form states
- error handling paths
- shared mappers
- shared UI components
- query result shape
- theme/layout behavior
- shared validation rules

### 3. Define the priority scenarios
Do not test everything equally.

Prioritize:
1. the original failing or changed scenario
2. the most likely adjacent regressions
3. contract-sensitive scenarios
4. non-happy-path scenarios
5. historically fragile areas if relevant

Regression testing should be risk-based, not random.

### 4. Verify the main scenario first
Confirm that the intended fix or feature actually works in the primary flow.

Document:
- steps taken
- inputs or data conditions
- observed result
- whether expected behavior matches actual behavior

Do not expand into regression testing before the main scenario is confirmed.

### 5. Verify adjacent flows
Check nearby behaviors that could be affected by the same change.

Examples:
- similar API requests using the same mapper
- sibling UI components sharing the same validation logic
- alternative paths using the same stored procedure
- loading, empty, or error states using the same component logic
- older or missing document-field scenarios in Couchbase-backed flows

### 6. Check non-happy-path behavior
Review whether the change affected:
- validation behavior
- error handling
- null or empty results
- permissions or roles
- alternate navigation paths
- incomplete or missing data states

This is where many regressions hide.

### 7. Cross-check evidence
Use Copilot to help identify likely missed areas, but do not treat suggestions as verification.

Useful questions:
- What related scenarios share this code path?
- What negative cases should be checked here?
- Which consumers depend on this shape or behavior?
- What would a strong QA reviewer worry about in this change?

### 8. Record what was checked
Document:
- what scenarios were tested
- what passed
- what failed
- what was not checked
- what still looks risky
- what follow-up testing may still be needed

### 9. Decide readiness
At the end, decide whether:
- regression risk is acceptably covered
- the change is ready for approval
- additional checks are needed
- unresolved uncertainty should block signoff

---

## Verification and Evidence

Strong regression verification includes:
- explicit scenarios checked
- clear observed behavior
- related risk areas covered
- notes on non-happy-path behavior
- honest documentation of gaps

Weak regression verification includes:
- “looks fine”
- “main case works”
- “nothing else seemed broken”
- “Copilot didn’t find more risks”

---

## Exit Criteria

The workflow is complete when:
- the main scenario is verified
- key regression risks have been checked proportionally to impact
- adjacent flows were considered thoughtfully
- evidence is documented clearly
- remaining uncertainty is stated honestly

---

## Common Failure Modes

- testing only the primary fix and nothing around it
- checking only happy-path behavior
- skipping contract-sensitive verification
- assuming similar flows are safe without checking
- treating AI suggestions as proof
- failing to document what was not verified