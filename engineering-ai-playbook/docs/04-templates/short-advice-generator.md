# Short Advice Generator

## When to Use

Use this prompt to generate short guidance files such as:
- `developers-short.md`
- `qa-short.md`
- `backend-short.md`
- `frontend-short.md`

## Prompt Template

```text
Create the file: [FILE_NAME]

This is a short advice file.

Goal:
Provide condensed, high-signal guidance that team members can read quickly and apply immediately.

Requirements:
- Keep it concise
- Focus on practical rules and habits
- Use short sections with clear headings
- Include only the most important guidance
- Avoid long explanations
- Avoid repeated background context
- Make the file easy to scan in a few minutes
- Adapt the content to GitHub Copilot, Azure DevOps, Visual Studio, and VS Code where relevant

Suggested structure:
1. Purpose
2. Core rules
3. Common mistakes to avoid
4. What good looks like

Return only the final Markdown content for the file.