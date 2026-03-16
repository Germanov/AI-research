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
| Task progress | Azure DevOps work item |
| PR summary and implementation context | PR description |
| Interrupted work handoff | Azure DevOps work item, PR description, or investigation note |
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