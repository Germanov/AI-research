# Frontend Checklist

## Scope

Use this checklist for frontend implementation, review, and verification work.

---

## Understanding and Scope

- [ ] The user-facing behavior is clearly defined.
- [ ] The affected screen, component, or flow is identified.
- [ ] Existing UI patterns were reviewed before implementation.
- [ ] The scope is controlled and does not include unrelated UI cleanup.

---

## Design System and Consistency

- [ ] Existing Angular patterns were reused.
- [ ] Shared components were reused where appropriate.
- [ ] The custom theme and approved layout primitives such as `.grid` were used correctly.
- [ ] No unnecessary one-off CSS or local layout hacks were introduced.
- [ ] The change remains visually consistent with surrounding screens.

---

## Behavior Quality

- [ ] Happy-path behavior works as expected.
- [ ] Error, empty, and loading states were considered.
- [ ] Validation behavior remains correct.
- [ ] Interaction behavior remains consistent.
- [ ] The change does not introduce hidden behavior drift.

---

## Verification

- [ ] Relevant tests were added or updated where appropriate.
- [ ] The project builds successfully.
- [ ] The rendered UI was checked manually.
- [ ] Relevant screen sizes were checked.
- [ ] Keyboard and focus behavior were reviewed where relevant.

---

## Review Readiness

- [ ] The change is small enough and clear enough to review.
- [ ] The summary explains the user-visible change clearly.
- [ ] Verification notes are specific.
- [ ] Any unverified areas are documented.