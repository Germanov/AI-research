# Checklist Generator

## When to Use

Use this prompt to generate checklist files such as:
- `definition-of-done.md`
- `backend-checklist.md`
- `frontend-checklist.md`
- `qa-checklist.md`

## Prompt Template

```text
Create the file: [FILE_NAME]

This is a checklist file.

Goal:
Create a precise, practical checklist that engineers or QA can use during implementation, review, or verification.

Requirements:
- Use checkbox-style Markdown lists
- Keep items specific and verifiable
- Avoid vague checklist items like "code is good"
- Group related checks into sections
- Include context-specific items where relevant
- Prefer fewer strong checks over many weak ones
- Keep the checklist usable in real PRs and real delivery work

Suggested structure:
1. Scope
2. Understanding and scope checks
3. Implementation checks
4. Verification checks
5. Review or readiness checks

Return only the final Markdown content for the file.