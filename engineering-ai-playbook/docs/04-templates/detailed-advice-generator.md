# Detailed Advice Generator

## When to Use

Use this prompt to generate detailed advice files such as:
- `developers-detailed.md`
- `qa-detailed.md`
- `backend-detailed.md`
- `frontend-detailed.md`
- `sql-detailed.md`
- `couchbase-detailed.md`

## Prompt Template

```text
Create the file: [FILE_NAME]

This is a detailed advice file.

Goal:
Provide a practical internal guide that explains what the team should do, why it matters, where the risks are, and how to apply the guidance in day-to-day work.

Requirements:
- Be descriptive and concrete
- Include rationale behind the guidance
- Include examples relevant to our stack
- Include cautions, tradeoffs, and failure modes
- Adapt the guidance to [your tools goes here](example: Azure DevOps, Visual Studio, and VS Code)
- Respect our existing architecture patterns described in the provided context
- Avoid generic AI-tool commentary
- Keep the writing structured and directly useful

Suggested structure:
1. Purpose
2. Core position
3. Recommended way of working
4. Best practices
5. Risks and anti-patterns
6. What good looks like

Return only the final Markdown content for the file.