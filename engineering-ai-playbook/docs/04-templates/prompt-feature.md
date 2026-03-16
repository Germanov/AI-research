# Feature Prompt

## Good follow-up prompts

- Show the smallest code change that fixes this safely.
- Simplify this fix without changing behavior.
- List what I should verify manually after making this change.
- What related flows are at risk for the same reason?

## When to Use

Use this prompt when implementing a new feature or extending existing behavior with GitHub Copilot.

It is intended for:
- backend feature work
- frontend feature work
- service enhancements
- UI enhancements
- medium-sized changes where planning and scope control matter

---

## Prompt Template

```text
Help me implement this feature using a controlled, reviewable approach.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Feature details:
- Affected area: [service / endpoint / component / screen / flow]
- Feature summary: [describe the feature]
- Acceptance criteria: [list criteria]
- Non-goals: [what should not be changed]
- Constraints: [technical or product constraints]
- Relevant files or code paths: [optional]
- Existing similar behavior: [optional]

Your task:
1. Help me understand the best existing pattern to follow in this codebase.
2. Break the feature into the smallest safe implementation slice.
3. Identify what contracts, UI behavior, or data behavior must remain unchanged.
4. Suggest a minimal implementation approach that fits the current architecture.
5. Suggest tests and verification steps.
6. Call out risks, edge cases, and likely review concerns.
7. If multiple approaches are possible, recommend the safest and most consistent one.

Important rules:
- Reuse existing patterns before introducing new abstractions.
- Preserve service, UI, and persistence conventions.
- Do not bypass the Angular theme or shared layout primitives.
- Do not redesign data access unless the task explicitly requires it.
- Keep the change small enough to review comfortably.
- Be explicit about verification.

Return your answer in this structure:
1. Existing pattern to follow
2. Smallest safe implementation plan
3. What must not change
4. Risks and edge cases
5. Verification plan
6. Recommended next implementation step
