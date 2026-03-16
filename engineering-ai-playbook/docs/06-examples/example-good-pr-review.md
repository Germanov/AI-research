# Example: Good PR Review

## Purpose

This example shows what strong PR review feedback looks like for AI-assisted engineering work.

---

## Review Summary

The PR appears to address the null-handling issue on the order details screen, but the current verification story is too weak for approval.

The implementation looks reasonably small, but there are still two important questions:
- whether the same response shape is used by other screens
- whether the fallback behavior is consistent with existing UI patterns

---

## Scope Concerns

The scope is mostly controlled, but there is one concern:
- the PR updates both the order details component and a shared display helper

That may be justified, but the PR description should explain whether the shared helper change is intended to affect other screens.

---

## Pattern and Architecture Fit

Positive:
- the change appears to reuse the existing UI fallback pattern
- the implementation is not overly abstract

Needs review:
- confirm that the shared helper already handles similar display fallbacks elsewhere
- confirm that this does not introduce a one-off display rule inconsistent with other screens

---

## Risk Areas

Main risk areas:
- hidden UI behavior change in other screens using the same helper
- inconsistent fallback rendering between order details and order summary
- possible backend contract assumption still remaining in sibling consumers

---

## Verification Gaps

Current gaps:
- no evidence that sibling screens were checked
- no visual verification note for empty or fallback display state
- no statement about whether the API contract was intentionally left unchanged

Suggested additional verification:
- check order summary and search result views using the same customer display value
- confirm the API response shape was not changed
- add a short note on expected fallback display text

---

## Suggested Review Comments

1. Please clarify whether the shared helper change is intended to affect other screens or only order details.
2. Please add verification notes for sibling UI flows that use the same customer display value.
3. Please confirm whether the API contract remains unchanged and this is purely a frontend fallback fix.

---

## Final Assessment

Not ready for approval yet.

The change is close, but the PR needs a stronger verification story and a clearer explanation of the shared-helper impact.