# Copilot Instructions

Follow the existing patterns already established in this repository.

Before changing files:
- read the relevant existing implementation or documentation first
- read `.github/copilot-instructions.md`
- read any applicable `.github/instructions/*.instructions.md` files
- read the active task continuity note under `work-context/` if one exists
- read any durable lessons that clearly apply to the task

Core rules:
- Prefer the smallest safe change.
- Do not widen scope with unrelated refactoring.
- Reuse existing patterns before introducing new abstractions.
- Preserve public behavior unless the task explicitly requires a change.
- Keep changes easy to review.
- Verify behavior before claiming the task is complete.
- Be explicit about assumptions, risks, and anything not verified.

Implementation rules:
- Understand the existing code path before generating code.
- Ask codebase questions before proposing broad changes.
- Keep AI-generated code simple and maintainable.
- Align with the repository’s current naming, structure, and conventions.
- Do not introduce parallel architecture or one-off patterns without clear justification.

Continuity rules:
- Use `.github/copilot-instructions.md` for stable repository behavior.
- Do not use instruction files as a live session-memory file.
- Keep in-progress or blocked task state in `work-context/` notes by default.
- Prefer one continuity note per task, branch, or timestamped pause instead of one shared mutable file.
- Update continuity notes when a major decision changes the plan, when a blocker appears, before pausing, before handoff, and when work is done.

Reusable lessons rules:
- Promote a correction into durable lessons only when it is repeated or clearly reusable.
- Record durable lessons with a date, author or committer, rule, context, and prevention or reuse guidance.

Verification rules:
- Prefer evidence over confidence.
- Add or update tests where appropriate.
- Check the changed behavior directly, not only compilation.
- Call out any areas that need extra reviewer attention.

If there is uncertainty, say so clearly instead of guessing.
