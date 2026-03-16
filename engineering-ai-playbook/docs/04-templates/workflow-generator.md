## When to Use

Use this prompt to generate workflow files such as:
- `bugfix-workflow.md`
- `feature-workflow.md`
- `pr-review-workflow.md`

## Prompt Template

```text
Create the file: [FILE_NAME]

This is a workflow file.

Goal:
Define a repeatable step-by-step process the team can follow during AI-assisted engineering work with GitHub Copilot.

Requirements:
- Write the workflow as an operational guide
- Use ordered steps
- Make each step concrete and testable
- Include entry conditions and exit conditions
- Include verification requirements
- Include role responsibilities where relevant
- Include warnings for risky shortcuts
- Adapt to the provided architecture, delivery workflow, and technical constraints where relevant

Suggested structure:
1. Purpose
2. When to use this workflow
3. Preconditions
4. Step-by-step workflow
5. Verification and evidence
6. Exit criteria
7. Common failure modes

Return only the final Markdown content for the file.