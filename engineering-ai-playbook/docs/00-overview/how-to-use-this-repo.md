# How to Use This Repo

## Purpose

This repository contains shared team guidance for using GitHub Copilot in engineering work.

It is the central place for:
- AI usage principles
- developer and QA guidance
- workflows
- checklists
- reusable prompt templates
- example documents showing what good output looks like

It is not a service-specific instruction repository.

---

## What Belongs Here

This repository should contain:
- shared guidance that applies across multiple repositories
- standards for AI-assisted implementation and review
- short and detailed advice docs
- workflows for bug fixing, feature work, PR review, regression checking, and incident investigation
- checklists for delivery and verification
- reusable prompt templates for developers and QA
- optional helper script guidance for repeatable documentation tasks
- prompt generators for creating or extending documentation
- example files showing strong bug reports, plans, reviews, and verification notes

---

## What Does Not Belong Here

This repository should not contain:
- service-specific `.github` instruction files used directly by application repositories
- one-off prompts for temporary tasks
- task notes for individual bugs or stories
- codebase-specific rules that only apply to one product repo
- copied implementation details from product repositories
- temporary experiments that are not meant to become shared guidance

---

## Recommended Reading Order

Start here:

1. `docs/00-overview/researched-principles.md`
2. `docs/00-overview/ai-working-agreement.md`
3. `docs/00-overview/execution-and-handoff-rules.md`
4. `docs/00-overview/decision-rules.md`
5. `docs/05-checklists/definition-of-done.md`

Then read based on role:

### Developers
- `docs/01-short-advice/developers-short.md`
- `docs/02-detailed-advice/developers-detailed.md`
- `docs/02-detailed-advice/backend-detailed.md` or `frontend-detailed.md`
- `docs/05-checklists/backend-checklist.md` or `frontend-checklist.md`

### QA
- `docs/01-short-advice/qa-short.md`
- `docs/02-detailed-advice/qa-detailed.md`
- `docs/05-checklists/qa-checklist.md`

### Workflow guidance
- `docs/03-workflows/bugfix-workflow.md`
- `docs/03-workflows/feature-workflow.md`
- `docs/03-workflows/pr-review-workflow.md`
- `docs/03-workflows/qa-regression-workflow.md`
- `docs/03-workflows/incident-investigation-workflow.md`

### Prompt usage
- `docs/04-templates/master-prompt.md`
- `docs/04-templates/prompt-bugfix.md`
- `docs/04-templates/prompt-feature.md`
- `docs/04-templates/prompt-pr-review.md`
- `docs/04-templates/prompt-api-contract-check.md`
- `docs/04-templates/prompt-sql-sp-change.md`
- `docs/04-templates/prompt-angular-theme-review.md`
- `docs/04-templates/prompt-qa-regression.md`
- `docs/04-templates/prompt-incident-root-cause.md`

### Examples
- `docs/06-examples/example-good-bug-report.md`
- `docs/06-examples/example-good-feature-plan.md`
- `docs/06-examples/example-good-handoff.md`
- `docs/06-examples/example-good-pr-review.md`
- `docs/06-examples/example-good-regression-test.md`
- `docs/06-examples/example-good-verification-notes.md`

---

## Folder Guide

### `00-overview`
Use for foundational documents and operating rules.

Files in this section define:
- why the repo exists
- how the team uses Copilot
- how decisions should be made
- how work should be recorded and handed over
- how repeated lessons should become shared guidance
- how the rest of the documentation should be interpreted

### `01-short-advice`
Use for condensed guidance that can be read quickly.

These files are meant for:
- quick onboarding
- fast refreshers
- role-specific rules
- practical day-to-day reminders
- short, high-signal guidance for developers and QA

### `02-detailed-advice`
Use for deep reference material and role-specific standards.

These files explain:
- what to do
- why it matters
- where the risks are
- how guidance should be applied to our stack
- how to handle backend, frontend, SQL, and Couchbase work more safely

### `03-workflows`
Use for repeatable delivery processes.

These files define step-by-step ways of working for:
- bug fixing
- feature work
- PR review
- regression checking
- incident investigation
- structured execution and verification

### `04-templates`
Use for reusable working assets.

This section contains:
- prompt generators for creating or extending documentation
- ready-to-copy working prompts for developers and QA using Copilot
- repo-local instruction templates that can later be copied into service repositories under `.github/`

Examples include:
- document generator prompts
- bug-fix and feature prompts
- PR review prompts
- API, SQL, Angular, regression, and incident prompts
- Copilot instruction templates for backend, frontend, and tests

### `05-checklists`
Use for verification and review checklists.

These files are meant to help the team confirm:
- whether work is actually done
- whether the right verification happened
- whether the biggest risks were checked
- whether a backend, frontend, or QA change is ready for review or signoff

### `06-examples`
Use for concrete examples of good practice.

These files are meant to show:
- what a strong bug report looks like
- what a good feature plan looks like
- what strong PR feedback looks like
- what good regression thinking looks like
- what strong verification notes look like
- what a usable handoff looks like

This section is especially useful for onboarding, calibration, and improving consistency.

### `07-lessons-learned`
Use for team memory and repeated lessons.

These files are meant to capture:
- repeated mistakes
- repeated review findings
- patterns that proved useful more than once
- lessons that should update future guidance
- practical learning that should not stay only in memory or chat

This section helps turn repeated experience into team-level improvement.

### `08-helper-scripts`
Use for practical guidance around small, explicit helper scripts that support the workflow.

These files are meant to explain:
- when a helper script is worth using
- how to run it safely
- what problem it solves
- where its output should go
- what it should not automate away

---

## How This Repo Relates to Service Repos

This repo contains shared documentation.

Service-specific Copilot instructions belong inside each service repository under `.github/`, for example:

```text
service-repo/
└─ .github/
   ├─ copilot-instructions.md
   └─ instructions/
      ├─ backend.instructions.md
      ├─ frontend.instructions.md
      └─ tests.instructions.md
