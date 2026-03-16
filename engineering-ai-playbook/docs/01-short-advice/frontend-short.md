# Frontend Short Guidance

## Purpose

Use Copilot to speed up frontend work while preserving our Angular standards, custom theme behavior, and UI consistency.

The goal is not to generate more UI code.  
The goal is to deliver correct behavior with consistent user experience.

---

## Core Rules

### Start from the existing UI system
Before implementing a change, use Copilot to find:
- the existing component pattern
- related screens or flows
- shared UI primitives already used in the repo
- theme or layout conventions relevant to the change
- tests that already cover similar behavior

Do not start by inventing a new component structure unless the task requires it.

### Use the custom theme and approved layout primitives
Our theme and helpers such as `.grid` are part of the engineering standard.

Prefer:
- existing layout primitives
- existing shared components
- existing design conventions
- existing responsive behavior patterns

Avoid:
- one-off CSS for problems already solved by the theme
- inconsistent spacing/layout logic
- bypassing shared UI behavior

### Be explicit about user behavior
Frontend prompts and implementation should state:
- what the user should see
- what the user should be able to do
- what should remain unchanged
- what should happen on error, empty, or loading states

AI-generated UI work is weaker when the expected behavior is vague.

### Keep changes small and reviewable
Frontend diffs become harder to trust when they:
- mix styling, state changes, and structural refactors together
- rewrite working components unnecessarily
- spread the change across too many unrelated files

Prefer narrow, understandable changes.

### Verify visually and behaviorally
Frontend work is not done when the code compiles.

Check:
- the actual rendered behavior
- relevant screen sizes
- validation and error states
- empty states
- keyboard and focus behavior where relevant
- consistency with existing theme behavior

---

## Angular-Specific Rules

- Reuse existing Angular patterns before introducing new abstractions.
- Keep templates, state handling, and component behavior aligned with the rest of the codebase.
- Prefer existing shared components and utilities over custom one-off solutions.
- Keep the implementation easy for another team member to understand and maintain.

---

## Common Mistakes to Avoid

- Letting Copilot generate UI that ignores the design system
- Solving layout issues outside the theme when the theme already provides the pattern
- Verifying only the happy path
- Skipping responsive checks
- Accepting verbose or over-engineered component code
- Changing visual behavior without calling it out clearly

---

## What Good Looks Like

A strong frontend change is:
- consistent with the design system
- behaviorally correct
- visually verified
- responsive
- accessible enough for the task
- small enough to review without guesswork

If the UI technically works but breaks consistency, the change is not good enough.