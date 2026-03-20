# Copilot Instructions for This Repo

This repository stores shared Copilot guidance and helper-script documentation.

It is not a product repository and it is not the place for service-specific implementation notes or live task memory.

## Before changing files

Read these first when they are relevant to the task:

1. `engineering-ai-playbook/README.md`
2. `engineering-ai-playbook/docs/00-overview/where-to-record-what.md`
3. `engineering-ai-playbook/docs/00-overview/execution-and-handoff-rules.md`
4. the specific workflow, template, or lessons file you are about to change
5. a local `work-context/` continuity note for the active task if one exists

## Artifact rules

- Use this `.github/copilot-instructions.md` file for stable repository behavior.
- Do not use `.github` instruction files as a live session-memory or blocker log.
- Keep in-progress or blocked task state in `work-context/` notes by default.
- Prefer one continuity file per task, branch, or timestamped pause instead of one shared mutable file.
- Keep `work-context/` local or gitignored by default in multi-user repositories.
- Promote a correction into `docs/07-lessons-learned/` only when it is repeated or clearly reusable.

## Working rules

- Keep shared guidance generic enough to reuse across repositories.
- Do not move service-specific rules into this repo.
- If a change updates helper-script output, update the corresponding documentation in the same change.
- If a change updates a reusable lesson format, update the guidance that explains when to add a lesson.
- Keep cross-references current so the reading path stays easy to follow.

## `.github/instructions/` scope

Use `.github/instructions/*.instructions.md` only when a repository has durable domain-specific rules that are clearer in separate files.

For this repo, keep the first implementation in the main `.github/copilot-instructions.md` file unless a stable split becomes clearly necessary.
