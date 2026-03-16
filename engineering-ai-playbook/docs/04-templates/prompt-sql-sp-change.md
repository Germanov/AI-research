# SQL / Stored Procedure Change Prompt

## When to Use

Use this prompt when reviewing or implementing SQL-related changes with GitHub Copilot.

It is intended for:
- query changes
- Entity Framework query changes
- stored procedure changes
- mapper/result-shape-sensitive changes
- data-related bug fixes
- review of database-impacting PRs

---

## Prompt Template

```text
Help me review or implement this SQL-related change safely.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

SQL change context:
- Affected service: [service name]
- Affected area: [query / repository / stored procedure / mapper]
- Change summary: [describe the change]
- Expected behavior: [expected behavior]
- Relevant files or objects: [stored procedure name / repository / mapper / DTO]
- Known constraints: [optional]
- Existing verification already done: [optional]

Your task:
1. Identify the existing data-access pattern that should be followed.
2. Explain what result-shape, null-handling, ordering, or compatibility risks exist.
3. Highlight what must not change in consuming behavior.
4. Suggest the smallest safe implementation approach.
5. Suggest verification steps for query behavior, stored procedure compatibility, and consumer impact.
6. Call out any performance-sensitive concerns that should be reviewed.
7. If uncertainty remains, state it clearly instead of guessing.

Important rules:
- Treat stored procedures as intentional architecture.
- Do not replace a stored procedure with EF unless the task explicitly requires redesign.
- Preserve compatibility with consuming code.
- Be specific about result-shape and data-behavior risks.
- Avoid broad refactoring.

Return your answer in this structure:
1. Existing pattern to follow
2. Data and compatibility risks
3. What must not change
4. Smallest safe change
5. Verification plan
6. Performance or review concerns
7. Open uncertainties
