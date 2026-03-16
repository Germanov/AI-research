# Copilot Instructions

Follow the existing patterns already established in this repository.

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

Verification rules:
- Prefer evidence over confidence.
- Add or update tests where appropriate.
- Check the changed behavior directly, not only compilation.
- Call out any areas that need extra reviewer attention.

If there is uncertainty, say so clearly instead of guessing.