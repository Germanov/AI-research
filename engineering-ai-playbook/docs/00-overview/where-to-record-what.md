# Where to Record What

## Purpose

This document explains where information should be recorded so work stays easy to continue, review, and learn from.

It exists to remove ambiguity about where different kinds of information belong.

---

## Core Rule

Put information in the primary artifact for that kind of work.

Do not scatter the same truth across many places unless each location clearly serves a different purpose.

---

## Quick Mapping

| Type of information | Primary location |
|---|---|
| Team-wide AI guidance | This documentation repo |
| Service-specific Copilot instructions | Product repo `.github/` files |
| Repo-local continuity note for in-progress or blocked work | `work-context/*.md` in the active repo, usually local or gitignored |
| Task progress | Azure DevOps work item |
| PR summary and implementation context | PR description |
| Interrupted work handoff | Azure DevOps work item, PR description, investigation note, or local continuity note |
| Verification notes | PR description, work item, or dedicated note |
| Incident reasoning | Investigation note or work item |
| Repeated lessons | `docs/07-lessons-learned/` |
| Reusable prompt | `docs/04-templates/` |
| Repeated process gap | workflow or checklist file in this repo |
| Repeated technical pattern | detailed-advice file in this repo |

---

## 1. Team-Wide Guidance

Put team-wide guidance in this documentation repo.

Examples:
- principles for using Copilot
- working agreements
- decision rules
- execution and handoff rules
- reusable workflows
- reusable checklists
- reusable prompts

Use when:
- the guidance applies across multiple repos
- the lesson is stable
- the practice is worth reusing

---

## 2. Service-Specific Copilot Rules

Put service-specific Copilot rules inside the service repo.

Use:

```text
.github/copilot-instructions.md
.github/instructions/backend.instructions.md
.github/instructions/frontend.instructions.md
.github/instructions/tests.instructions.md
```

Use these files for stable repository behavior:
- pre-code reading order
- durable implementation rules
- verification expectations
- repository-specific quality constraints

Do not use `.github` instruction files for:
- temporary task state
- blocked-item tracking
- branch-specific handoff notes
- one-off session summaries

Add `.github/instructions/*.instructions.md` only when separate domain-specific rules are stable enough to justify the split.

---

## 3. Repo-Local Continuity Notes

Put in-progress or blocked task continuity in a repo-local continuity note.

Recommended default:

```text
work-context/
```

Use these notes for:
- restartable task state
- what is currently blocked
- what was already done
- what still remains
- where another person should continue
- what was verified so far

Recommended defaults:
- keep these files local or gitignored in multi-user repositories
- prefer one file per task, branch, or timestamped pause
- avoid one shared committed session-memory file

Use this structure:
- `Current Status`
- `What Was Done`
- `What Remains`
- `Blockers`
- `Where to Continue`
- `Risks and Uncertainties`
- `Verification Done`
- `Recommended Next Action`

Refresh the note when:
- a major decision is made
- a blocker is found or cleared
- work is paused
- work is handed over
- work is finished

---

## 4. Task Progress and Delivery State

Put delivery-state updates in the primary work artifact.

Use:
- Azure DevOps work item for task progress and official status
- PR description for implementation summary and review context
- investigation note for root-cause reasoning or exploratory work

Use a local continuity note to support continuity, but do not let it replace the primary delivery artifact when one exists.

---

## 5. Reusable Lessons

Put reusable Copilot-related lessons in `docs/07-lessons-learned/`.

Use this when:
- the same issue happened more than once
- a correction is clearly reusable across tasks or repos
- a prompt or review pattern repeatedly proves valuable
- the team wants Copilot to apply a durable new rule next time

Keep the durable lesson separate from session notes.

A continuity note explains the current task.

A lessons-learned file explains what should change in future tasks.

---

## Decision Heuristic

If the information is:

- stable and cross-repo -> put it in this documentation repo
- stable and repo-specific -> put it in `.github/`
- temporary and task-specific -> put it in a local continuity note
- part of delivery tracking -> put it in the work item or PR
- repeated and reusable -> promote it into the lessons-learned docs
