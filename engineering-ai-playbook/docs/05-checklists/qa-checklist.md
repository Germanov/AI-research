# QA Checklist

## Scope

Use this checklist for QA validation, regression review, and PR verification.

---

## Bug and Story Clarity

- [ ] Reproduction steps are clear.
- [ ] Expected behavior is explicit.
- [ ] Actual behavior is clear.
- [ ] Affected area, environment, or data conditions are identified.
- [ ] The intended fix or feature outcome is understandable.

---

## Risk Review

- [ ] Related flows or edge cases were considered.
- [ ] Contract-sensitive behavior was identified where relevant.
- [ ] UI state risks were considered where relevant.
- [ ] Data or integration risks were considered where relevant.
- [ ] Regression expectations are clear.

---

## Verification Quality

- [ ] The main scenario was tested.
- [ ] Relevant non-happy-path scenarios were considered.
- [ ] Verification is based on observed behavior, not only on implementation notes.
- [ ] Any available screenshots, logs, or examples were used where helpful.
- [ ] Unverified areas are stated clearly.

---

## Communication Quality

- [ ] Verification notes are specific enough for another team member to follow.
- [ ] PR feedback is clear and actionable.
- [ ] Risk concerns are called out explicitly.
- [ ] Any uncertainty is communicated honestly.

---

## Final Readiness

- [ ] The fix or feature behavior is credible based on evidence.
- [ ] Regression risk was considered before signoff.
- [ ] The change is ready for approval or the remaining concerns are clearly documented.