# Frontend Detailed Guidance

## Purpose

This document defines how frontend engineers should use GitHub Copilot in our environment.

The goal is to accelerate Angular development without weakening:
- UI consistency
- design-system discipline
- responsive behavior
- accessibility basics
- maintainability
- review quality

These guidelines apply to frontend work in VS Code across our Angular repositories.

---

## 1. Core Position

Copilot is a frontend implementation assistant, not a design-system replacement.

Use it to:
- understand existing component patterns
- locate similar screens and flows
- draft focused implementation changes
- generate test scaffolding
- identify missing states and edge cases
- help structure review and verification notes

Do not use it to:
- invent new UI patterns when stable ones already exist
- bypass the custom theme or approved layout primitives
- generate large component rewrites without need
- replace visual verification with code confidence
- produce “working” UI that is inconsistent with the system

Frontend quality is not only about whether code runs.  
It is also about whether behavior, layout, and consistency remain correct.

---

## 2. Default Frontend Working Model

The default frontend workflow is:

1. Understand the user-facing behavior being changed
2. Find the existing UI pattern in the codebase
3. Identify what must remain visually and behaviorally consistent
4. Plan the smallest safe change
5. Implement in a narrow slice
6. Verify visually and behaviorally
7. Review for simplicity, consistency, and maintainability

This matters in our environment because:
- Angular code is supported by a shared UI system
- the custom theme encodes standards
- layout/responsiveness is already solved in many places
- AI can generate visually plausible but system-inconsistent code very quickly

---

## 3. Start With the Existing UI System

Before generating frontend code, use Copilot to understand what already exists.

Questions to ask first:
- Which component already handles something similar?
- What pattern does this screen use for layout?
- Which shared component or utility should be reused?
- How do nearby screens handle validation, loading, and empty states?
- Where is the current theme pattern for this layout or interaction?
- What tests already cover similar behavior?

This matters because frontend consistency is easier to lose than to restore.

### Strong prompts
- “Find the existing pattern for responsive card layout in this repo.”
- “Show where this validation message pattern is already implemented.”
- “Which shared component should be used for this table action?”
- “How do similar screens use the theme and `.grid` layout?”

### Weak prompts
- “Build this screen.”
- “Improve this UI.”
- “Make this modern.”
- “Rewrite this component cleanly.”

The stronger the connection to the existing UI system, the better the result.

---

## 4. The Theme and Layout Primitives Are Mandatory Standards

Our custom Angular theme and approved helpers such as `.grid` are part of the engineering standard.

They should be treated as infrastructure, not optional convenience.

Copilot should prefer:
- shared theme abstractions
- existing layout primitives
- shared components
- established spacing and alignment patterns
- existing responsive behavior conventions

Copilot should avoid:
- ad hoc CSS when a theme abstraction exists
- custom layout logic for solved problems
- inconsistent spacing patterns
- screen-specific hacks that break the overall system

### Practical rule
If the design system already solves the problem, use the system.  
Do not generate a local workaround unless the task explicitly requires it.

---

## 5. Define UI Behavior Explicitly

Frontend prompts should describe behavior, not just structure.

State:
- what the user should see
- what the user should be able to do
- what should happen in loading state
- what should happen in empty state
- what should happen in error state
- what responsive behavior is expected
- what must remain unchanged

This improves both implementation quality and review clarity.

### Example
Better:
- “Update the table action area to add export behavior without changing existing row selection behavior. Use the existing theme/layout pattern and preserve responsive behavior.”

Worse:
- “Add export to this page.”

The more explicit the UI behavior, the less likely Copilot is to introduce drift.

---

## 6. Keep Frontend Changes Narrow and Reviewable

Frontend AI output becomes harder to trust when it:
- mixes layout, styling, state, and behavior changes at once
- rewrites working components unnecessarily
- adds new abstractions for a small change
- touches shared components without clear reason
- spreads a small task across many unrelated files

Prefer:
- one user-facing change at a time
- minimal touched surface
- local improvements before shared abstractions
- implementation separated from cleanup

### Why this matters
Narrow frontend changes are easier to:
- verify visually
- compare against intended behavior
- review for regressions
- explain to QA
- rollback safely

---

## 7. Angular-Specific Guidance

### 7.1 Reuse Angular patterns already in the repo
Follow existing conventions for:
- component structure
- template organization
- state handling
- event handling
- data binding
- service usage
- shared utility usage
- test structure

Even if another pattern is valid in general Angular practice, consistency inside the codebase is more valuable.

### 7.2 Prefer shared components over one-off solutions
Before generating new component markup or behavior, check:
- does a shared component already exist?
- does a nearby screen already solve this?
- does the theme already define the behavior?

Avoid introducing parallel implementations of:
- tables
- form patterns
- validation displays
- action bars
- layout wrappers
- responsive grids
- common interactive elements

### 7.3 Keep component logic understandable
Copilot often generates frontend code that is technically functional but too verbose.

Review for:
- unnecessary indirection
- too much local state
- over-extracted helper functions
- confusing event flow
- duplicated logic in template and component
- hard-to-read conditional rendering

Ask Copilot to simplify when the first draft is heavier than needed.

---

## 8. Visual and Behavioral Verification Is Mandatory

Frontend work is not done when the code compiles.

Verification should include:
- rendered UI behavior
- alignment with the design system
- relevant responsive states
- validation and error behavior
- empty and loading states
- interaction behavior
- keyboard/focus behavior where relevant

### Questions to ask
- Does it behave correctly, not just render?
- Does it still fit the surrounding UI?
- Did I verify the non-happy paths?
- Does it still work at relevant screen sizes?
- Did I accidentally bypass a theme rule?

This is especially important because AI-generated UI often looks correct in the main path while failing in the surrounding states.

---

## 9. Frontend Review Expectations

When reviewing AI-assisted frontend code, check:
- does the implementation match the intended user behavior?
- does it reuse the existing UI system?
- is the layout approach consistent with the theme?
- did the change introduce one-off CSS or local hacks?
- are error, empty, and validation states handled properly?
- is the code readable enough for another team member to maintain?

If the code technically works but breaks consistency, it is still a weak change.

---

## 10. QA Collaboration for Frontend Changes

Frontend changes should be communicated in a way that helps QA verify the correct behavior.

A good summary should explain:
- which screen or component changed
- what the user should now experience
- what did not change
- what states were verified
- what responsive or accessibility checks were performed
- what still needs extra review

Useful QA callouts:
- layout-sensitive changes
- theme-sensitive changes
- changed validation or feedback behavior
- edge cases that were manually checked
- conditions that were not fully verified locally

The goal is to make verification easier, not to force QA to rediscover intent from the code.

---

## 11. Review AI Output Aggressively

Copilot can generate frontend code that looks complete while still being weak.

Review generated output for:
- unnecessary CSS
- duplicated patterns
- inconsistency with shared components
- excessive complexity in component logic
- weak handling of edge states
- hidden changes to interaction behavior
- responsive behavior not grounded in the existing system

Useful follow-up prompts:
- “Simplify this while preserving behavior.”
- “Align this with the pattern used in [component/screen].”
- “Show the version that uses the existing theme/layout utilities.”
- “List the states this implementation needs to handle.”
- “What part of this change is actually necessary?”

---

## 12. Common Anti-Patterns

Avoid:
- asking Copilot to invent UI structure from scratch when good patterns already exist
- bypassing the custom theme for convenience
- solving layout issues with ad hoc CSS when `.grid` or another approved primitive already exists
- verifying only the happy path
- shipping frontend code that works on one screen size only
- accepting verbose component logic because it appears comprehensive
- changing shared UI behavior without calling it out clearly

---

## 13. What Good Looks Like

A strong frontend AI-assisted change is:
- consistent with the design system
- behaviorally correct
- visually verified
- responsive where needed
- clear enough to review
- simple enough to maintain

If the UI works but feels out of place in the product, the change is not good enough.