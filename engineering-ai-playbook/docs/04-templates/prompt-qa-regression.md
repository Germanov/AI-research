# QA Regression Prompt

## When to Use

Use this prompt when planning or performing regression verification with GitHub Copilot.

It is intended for:
- QA regression analysis
- developer self-checks before PR review
- bug-fix regression validation
- feature regression review
- contract-sensitive or UI-sensitive changes

---

## Prompt Template

```text
Help me define a focused regression verification plan for this change.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Change context:
- Affected area: [service / endpoint / screen / flow]
- Change summary: [describe the change]
- Original issue or feature goal: [summary]
- Expected behavior: [expected behavior]
- Known risk areas: [optional]
- Relevant files or code paths: [optional]
- Verification already done: [optional]

Your task:
1. Identify the most likely regression surface.
2. Propose the highest-priority regression scenarios to check.
3. Separate main-path checks from adjacent-flow checks.
4. Call out contract, UI, data, validation, or persistence risks where relevant.
5. Suggest which scenarios are most important for QA versus developer self-checks.
6. Highlight any non-happy-path scenarios that should not be missed.
7. If uncertainty exists, say so clearly.

Important rules:
- Do not generate a huge test list with weak value.
- Focus on realistic risk-based regression coverage.
- Be explicit about what behavior may have changed indirectly.
- Treat stored procedures, API contracts, and theme/layout rules as high-signal areas when relevant.

Return your answer in this structure:
1. Regression surface
2. Highest-priority scenarios
3. Adjacent-flow scenarios
4. Non-happy-path scenarios
5. QA focus areas
6. Developer self-check areas
7. Open uncertainties
