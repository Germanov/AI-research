# API Contract Check Prompt

## When to Use

Use this prompt when reviewing or changing backend API behavior with GitHub Copilot.

It is intended for:
- endpoint changes
- request/response model changes
- validation changes
- status code changes
- serialization changes
- refactoring that might affect public behavior
- PR review for contract-sensitive backend work

---

## Prompt Template

```text
Help me review this change for API contract safety.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

API change context:
- Affected service: [service name]
- Affected endpoint or handler: [endpoint / controller / handler]
- Change summary: [describe the change]
- Expected behavior: [expected behavior]
- Acceptance criteria: [criteria]
- Relevant files: [optional]
- Existing verification already done: [optional]

Your task:
1. Identify the contract-sensitive areas in this change.
2. Check what request/response behavior must remain unchanged.
3. Highlight risks around status codes, validation, serialization, and error behavior.
4. Identify anything that could break consumers even if the code compiles.
5. Suggest the smallest safe way to implement or review this change.
6. Suggest verification steps for proving contract safety.
7. If something is unclear, state the uncertainty explicitly.

Important rules:
- Preserve existing contracts unless the task explicitly requires a contract change.
- Do not widen scope into unrelated backend refactoring.
- Follow existing service and toolkit patterns.
- Be specific about what reviewers and QA should check.

Return your answer in this structure:
1. Contract-sensitive areas
2. What must remain unchanged
3. Risk areas
4. Smallest safe implementation or review guidance
5. Verification plan
6. Open uncertainties
