# Templates Guide

## Purpose

This folder contains reusable prompt assets and instruction templates.

It exists to help the team:
- generate documentation consistently
- use GitHub Copilot in a disciplined way
- standardize common prompts
- derive repo-local Copilot instruction files from shared guidance

---

## What Is In This Folder

This folder contains three kinds of assets:

### 1. Documentation generators
These help create or extend files in this documentation repo.

Examples:
- `master-prompt.md`
- `short-advice-generator.md`
- `detailed-advice-generator.md`
- `workflow-generator.md`
- `checklist-generator.md`

### 2. Working prompts
These are ready-to-copy prompts for developers and QA to use with Copilot during real work.

Examples:
- `prompt-bugfix.md`
- `prompt-feature.md`
- `prompt-pr-review.md`
- `prompt-api-contract-check.md`
- `prompt-sql-sp-change.md`
- `prompt-angular-theme-review.md`
- `prompt-qa-regression.md`
- `prompt-incident-root-cause.md`
- `prompt-create-handoff.md`

### 3. Repo-local instruction templates
These are templates for files that will later be copied into real service repositories under `.github/`.

Examples:
- `copilot-instructions-template.md`
- `backend.instructions.template.md`
- `frontend.instructions.template.md`
- `tests.instructions.template.md`

---

## How to Choose the Right File

### If you want to create or extend documentation
Use:
- `master-prompt.md`
- one of the generator files

### If you want help with real product work
Use a working prompt.

Examples:
- bug fix → `prompt-bugfix.md`
- feature work → `prompt-feature.md`
- PR review → `prompt-pr-review.md`
- contract-sensitive backend review → `prompt-api-contract-check.md`
- SQL or stored procedure work → `prompt-sql-sp-change.md`
- Angular UI consistency review → `prompt-angular-theme-review.md`
- regression planning → `prompt-qa-regression.md`
- incident investigation → `prompt-incident-root-cause.md`
- interrupted work / handoff → `prompt-create-handoff.md`

### If you want to prepare repo-local Copilot instructions
Use the instruction templates and then copy the final short version into a product repo.

---

## How to Use a Working Prompt

1. Open the relevant prompt file.
2. Copy the prompt template.
3. Fill in the placeholders.
4. Paste it into Copilot Chat.
5. Iterate with follow-up prompts if needed.
6. If the prompt proves reusable and valuable, improve the template in this folder.

---

## How to Maintain This Folder

When adding a new template, ask:
- is this reusable by more than one person or repo?
- is it stable enough to become shared guidance?
- does it overlap with an existing template?
- should it be a working prompt, a generator, or an instruction template?

Prefer:
- fewer strong templates
- prompts that are specific and practical
- prompts aligned to Azure DevOps, Visual Studio, and VS Code
- prompts that encourage smallest safe change and explicit verification

Avoid:
- vague “do everything” prompts
- duplicated templates with small wording differences
- templates that depend on one specific temporary task
- templates that encourage broad, weakly verified changes

---

## Final Rule

A template belongs here only if it improves repeatability, clarity, or safety for more than one piece of work.