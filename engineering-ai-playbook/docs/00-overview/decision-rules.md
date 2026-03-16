# Decision Rules

## Purpose

This document defines practical decision rules for using GitHub Copilot in daily engineering work.

It is intended to reduce hesitation, overuse, and misuse by making common choices easier and more consistent.

---

## 1. When to Use Copilot

Use Copilot when it helps you:
- understand existing code faster
- compare existing patterns
- plan a small safe change
- draft implementation scaffolding
- generate or refine tests
- review a change for risks or verification gaps
- improve clarity in bug reports, PRs, and verification notes

Use it as a force multiplier for thinking and execution.

---

## 2. When Not to Rely on Copilot

Do not rely on Copilot as the primary decision-maker when:
- a contract change is unclear
- expected behavior is not defined
- a production incident still lacks evidence
- the risk boundary is unknown
- the change touches sensitive data or security logic and has not been reviewed carefully
- the generated solution is larger than the problem requires
- the output conflicts with existing patterns

In those situations, use Copilot for support, not authority.

---

## 3. When to Ask Questions Before Coding

Ask codebase questions first when:
- the task touches multiple files
- the correct implementation pattern is unclear
- the change affects public behavior
- the issue may involve shared code
- the bug root cause is not obvious
- the data flow is not fully understood
- the UI pattern already exists somewhere in the repo

If you are uncertain where the change belongs, do not start with implementation.

---

## 4. When to Plan Before Coding

Create a plan first when:
- the task is non-trivial
- multiple layers are involved
- there is contract risk
- there is data-shape or persistence risk
- there is UI or responsive behavior risk
- the change is larger than a local edit
- QA or reviewers will need explicit guidance

A plan should be short and practical:
- goal
- scope
- what must not change
- verification path
- main risks

---

## 5. When to Keep the Change Small

Default to the smallest safe change unless there is a strong reason not to.

Choose a small change when:
- the bug is localized
- the feature can be delivered in a vertical slice
- the existing pattern is already adequate
- a larger refactor would increase review risk
- a fast rollback might matter
- the task is contract-sensitive or production-facing

If the change is hard to explain briefly, it is probably too large.

---

## 6. When Refactoring Is Allowed

Refactoring is allowed when it:
- directly reduces risk in the current task
- is necessary for correctness
- simplifies a clearly overcomplicated local area
- is explicitly requested
- makes verification easier without widening scope too much

Refactoring is not justified when it is:
- unrelated cleanup
- style preference only
- generic modernization
- architecture drift driven by AI suggestions
- mixed into a bug fix without clear need

---

## 7. When to Add or Update Tests

Add or update tests when:
- the change affects behavior that should stay protected
- a bug fix should be regression-resistant
- a contract boundary is involved
- the change affects validation or error handling
- the change affects shared logic
- there is a realistic automated way to capture the risk

Do not add weak tests just to look complete.

---

## 8. When Manual Verification Is Required

Manual verification is required when:
- UI behavior matters
- responsive behavior matters
- visual consistency matters
- automation does not fully capture the scenario
- the bug was originally reproduced manually
- a persistence or integration boundary is involved
- the change affects error, empty, or edge states that are not well covered automatically

Build success is not the same as behavior verification.

---

## 9. When QA Should Be Involved Early

Bring QA in early when:
- expected behavior is ambiguous
- regression risk is high
- a bug affects multiple flows
- a feature changes user-visible behavior significantly
- data or contract behavior could affect downstream consumers
- there is a history of fragility in the area

Early QA clarity usually improves both implementation and review.

---

## 10. When to Escalate Review Rigor

Use extra review rigor when the change touches:
- API contracts
- stored procedures
- SQL query semantics
- Couchbase document shape
- authorization or authentication
- shared UI components
- theme/layout primitives
- cross-service integration
- configuration-sensitive behavior
- production incident fixes

In these cases, ask for stronger evidence, not just stronger confidence.

---

## 11. When to Trust the Output Less

Trust Copilot output less when:
- it is large
- it introduces new abstractions
- it changes multiple layers at once
- it rewrites working code
- it touches data or contract boundaries
- it looks more generic than the surrounding code
- it explains itself better than the evidence supports

The more polished the output looks, the more important it is to verify it.

---

## 12. When to Create a Handoff

Create a handoff when:
- the work is not finished in one sitting
- another person may continue it
- you are blocked
- you are opening a PR but some risk remains
- QA needs exact verification context
- an investigation may resume later
- the work contains decisions or findings that should not be rediscovered

Put the handoff in the primary artifact for that work:
- Azure DevOps work item
- PR description
- task note
- investigation note
- reusable guidance file, if the lesson is team-wide

Do not leave the handoff only in chat.

---

## 13. When to Turn a Repeated Problem Into Documentation

Update shared documentation when:
- the same mistake happens twice
- the same review comment appears repeatedly
- a recurring gap in verification is observed
- a useful Copilot prompt pattern proves itself in real work
- a workflow or checklist is clearly missing a needed control

When this happens, update the right type of file:
- checklist for repeated verification gaps
- workflow for repeated process failures
- detailed advice for repeated technical patterns
- template for repeated Copilot prompt usage

---

## 14. Final Decision Rule

If Copilot helps you produce a smaller, clearer, better-verified change, use it.

If Copilot is pushing you toward a broader, riskier, less explainable change, stop and narrow the task.