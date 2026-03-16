# Bug Fix Prompt

## When to Use

Use this prompt when fixing a bug with GitHub Copilot.

It is intended for:
- backend bugs
- frontend bugs
- contract-sensitive defects
- data-related defects
- regressions
- issues where the safest fix matters more than speed

---

## Prompt Template

```text
Help me fix this bug using a disciplined, low-risk approach.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Bug details:
- Affected area: [service / endpoint / component / screen]
- Bug summary: [describe the bug]
- Reproduction steps: [steps]
- Expected behavior: [expected result]
- Actual behavior: [actual result]
- Known constraints: [constraints]
- Relevant files or code paths: [optional]
- Logs, payloads, screenshots, or examples: [optional]

Your task:
1. Help me understand the likely root cause.
2. Identify the existing code pattern that should be followed.
3. Propose the smallest safe fix.
4. Call out what must not change, especially contracts, UI behavior, or data behavior.
5. Suggest tests or verification steps.
6. Highlight regression risks and nearby affected areas.
7. If uncertainty remains, say so clearly instead of guessing.

Important rules:
- Do not propose a broad refactor unless absolutely necessary.
- Preserve existing architecture and repository patterns.
- Treat stored procedures, API contracts, and theme/layout primitives as intentional.
- Keep the solution reviewable.
- Prefer explicit verification over confidence.

Return your answer in this structure:
1. Likely root cause
2. Existing pattern to follow
3. Smallest safe fix
4. Risks and what must not change
5. Verification plan
6. Open uncertainties
