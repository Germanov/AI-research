# Angular Theme Review Prompt

## When to Use

Use this prompt when reviewing or implementing frontend changes with GitHub Copilot that must stay aligned with the Angular design system and custom theme.

It is intended for:
- component changes
- screen changes
- layout changes
- responsive behavior changes
- UI bug fixes
- PR review for theme or consistency risk

---

## Prompt Template

```text
Help me review or implement this frontend change so it stays aligned with our Angular patterns and custom theme.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Frontend change context:
- Affected screen or component: [screen / component / flow]
- Change summary: [describe the change]
- Expected user behavior: [expected behavior]
- What must remain unchanged: [existing behavior / layout / interactions]
- Relevant files: [optional]
- Existing verification already done: [optional]

Your task:
1. Identify the existing UI pattern or theme approach that should be followed.
2. Highlight any risks of bypassing the theme or shared layout system.
3. Explain what user-visible behavior must remain unchanged.
4. Suggest the smallest safe implementation or review approach.
5. Identify visual, responsive, validation, and interaction states that should be checked.
6. Point out any unnecessary complexity or one-off CSS risk.
7. If anything is unclear, say so explicitly.

Important rules:
- Prefer the custom theme and approved layout primitives such as .grid.
- Reuse existing Angular and shared UI patterns.
- Avoid one-off CSS when the design system already provides the solution.
- Be explicit about responsive behavior and non-happy-path states.
- Keep the change easy to review.

Return your answer in this structure:
1. Existing pattern to follow
2. Theme or consistency risks
3. What must remain unchanged
4. Smallest safe implementation or review guidance
5. Verification plan
6. Complexity or maintainability concerns
7. Open uncertainties
