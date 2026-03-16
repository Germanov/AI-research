# Frontend Instructions

Follow the existing Angular and UI patterns in this repository.

Rules:
- Reuse shared components and existing screen patterns before creating new ones.
- Prefer the custom theme and approved layout primitives such as `.grid`.
- Do not introduce one-off CSS when the design system already provides the solution.
- Keep the smallest safe frontend change.
- Do not widen scope with unrelated cleanup or UI restructuring.

Behavior:
- Preserve existing user-visible behavior unless the task explicitly requires a change.
- Be explicit about loading, empty, validation, and error states.
- Keep responsive behavior aligned with the existing UI system.
- Maintain consistency with surrounding screens and shared components.

Code quality:
- Keep component logic simple and maintainable.
- Avoid unnecessary abstraction or over-engineered state handling.
- Align with current Angular patterns used in the repository.
- Simplify AI-generated code if it is more complex than needed.

Verification:
- Verify rendered behavior, not only code structure.
- Check relevant screen sizes where appropriate.
- Review keyboard and focus behavior where relevant.
- Call out any visual or interaction behavior that still needs manual review.