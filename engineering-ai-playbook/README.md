# AI Research and Engineering Playbook

## Purpose

This repository contains shared team guidance for using GitHub Copilot in engineering work.

It exists to help the team:
- use Copilot more effectively
- keep engineering quality high
- improve verification and review quality
- make work easier to continue, review, and hand over
- turn repeated lessons into reusable team guidance

This repository is for shared practices and reusable assets.  
It is not a product repository and it is not the place for service-specific implementation notes.

---

## Who This Repo Is For

This repo is intended for:
- developers
- QA engineers
- engineering leads
- anyone creating reusable Copilot prompts, checklists, or working guidance for the team

---

## Scope

This repository contains shared guidance for using GitHub Copilot in engineering work.

The guidance is intentionally general enough to be reused across teams and repositories.
Team-specific, application-specific, and repository-specific details should live in:
- prompt inputs
- repo-local Copilot instruction files
- work items, PRs, and investigation notes
- service-specific documentation

---

## Start Here

Read these first:

1. `docs/00-overview/researched-principles.md`
2. `docs/00-overview/ai-working-agreement.md`
3. `docs/00-overview/execution-and-handoff-rules.md`
4. `docs/00-overview/decision-rules.md`
5. `docs/00-overview/where-to-record-what.md`
6. `docs/05-checklists/definition-of-done.md`

---

## Reading Paths

### If you are a developer
Start with:
- `docs/01-short-advice/developers-short.md`
- `docs/02-detailed-advice/developers-detailed.md`
- `docs/02-detailed-advice/backend-detailed.md` or `frontend-detailed.md`
- `docs/05-checklists/backend-checklist.md` or `frontend-checklist.md`

Then use:
- `docs/03-workflows/`
- `docs/04-templates/`

### If you are in QA
Start with:
- `docs/01-short-advice/qa-short.md`
- `docs/02-detailed-advice/qa-detailed.md`
- `docs/05-checklists/qa-checklist.md`

Then use:
- `docs/03-workflows/qa-regression-workflow.md`
- `docs/03-workflows/incident-investigation-workflow.md`
- `docs/04-templates/`

### If you are updating the playbook
Start with:
- `docs/00-overview/how-to-use-this-repo.md`
- `docs/00-overview/where-to-record-what.md`
- `docs/04-templates/README.md`
- `docs/07-lessons-learned/`

---

## Repository Structure

```text
docs/
├─ 00-overview/
├─ 01-short-advice/
├─ 02-detailed-advice/
├─ 03-workflows/
├─ 04-templates/
├─ 05-checklists/
├─ 06-examples/
└─ 07-lessons-learned/