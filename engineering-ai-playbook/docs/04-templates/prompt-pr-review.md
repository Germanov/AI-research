# PR Review Prompt

## Good follow-up prompts:

- Show me the smallest vertical slice for this feature.
- What files should change first?
- What should QA verify for this feature?
- Simplify this implementation so it matches existing patterns better.

## When to Use

Use this prompt when reviewing a pull request or local diff with GitHub Copilot.

It is intended for:
- developer review
- QA review support
- backend PRs
- frontend PRs
- AI-assisted code review
- pre-review self-checks

---

## Prompt Template

```text
Review this change as if you are a strong reviewer checking correctness, scope, and verification quality.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Review target:
- Change summary: [describe the PR or diff]
- Problem being solved: [bug / feature / refactor goal]
- Acceptance criteria or expected behavior: [criteria]
- Files changed: [optional]
- Verification already done: [optional]
- Areas of concern: [optional]

Your task:
1. Review whether the change solves the stated problem.
2. Check whether the scope is controlled or has expanded unnecessarily.
3. Check whether the implementation follows existing patterns.
4. Identify any contract, UI, or data boundary risks.
5. Identify weak points in tests or verification.
6. Point out unnecessary complexity or over-engineering.
7. Suggest what reviewers or QA should pay extra attention to.

Important rules:
- Be practical and specific.
- Do not praise the change unless it is supported by evidence.
- Call out hidden risk areas clearly.
- Treat stored procedures, API contracts, and theme/layout rules as high-signal review areas when relevant.
- If verification is weak, say so directly.

Return your answer in this structure:
1. Review summary
2. Scope concerns
3. Pattern and architecture fit
4. Risk areas
5. Verification gaps
6. Suggested review comments
7. Final assessment
