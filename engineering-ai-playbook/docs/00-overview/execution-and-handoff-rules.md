# Execution and Handoff Rules

## Purpose

This document defines how work should be recorded, handed over, resumed, and turned into reusable team knowledge.

These rules apply to:
- development work
- QA work
- bug fixing
- feature work
- investigations
- PR preparation
- AI-assisted work with GitHub Copilot

The goal is to make work:
- restartable
- reviewable
- transferable
- learnable

---

## 1. Keep important work in a durable place

Important work must not live only in chat or memory.

When work is non-trivial, save the current state in the primary artifact for that work.

Use this mapping:

### For product work
Put the handoff or progress update in:
1. the Azure DevOps work item
2. the PR description if a PR already exists
3. a repo-local task or investigation note if the work is complex and not yet in PR

### For shared team guidance
Put the update in the relevant file in this documentation repo.

### For reusable prompts
Put the reusable version in `docs/04-templates/`.

### For repeated lessons or mistakes
Put the lesson in the relevant best-practice, workflow, checklist, or detailed-advice file.

Do not leave important handoff context only in chat.

---

## 2. Update Markdown files regularly when they are the source of truth

If a Markdown file is being used to track a task, investigation, lesson, or reusable guidance, update it regularly.

Update it when:
- a major decision is made
- the plan changes
- root cause becomes clearer
- verification is completed
- a blocker is found
- the work is being handed over
- the work is finished

Do not wait until the very end if the work is long or likely to be interrupted.

---

## 3. When work is finished, update the file before closing the loop

If a file is being used to track the work, update it before treating the task as complete.

That update should include:
- what was completed
- what changed
- how it was verified
- what remains open, if anything
- what another person should know later

Implementation without an updated handoff or summary is incomplete.

---

## 4. Use a fixed handoff structure

When work may continue later or be picked up by someone else, leave a handoff using this structure:

## Current Status
[not started / in progress / blocked / ready for review / ready for QA / done]

## What Was Done
- [completed step]
- [completed step]
- [completed step]

## What Remains
- [next step]
- [next step]
- [next step]

## Where to Continue
- Main file(s): [file paths]
- Branch or PR: [branch/PR]
- Work item: [link or ID]

## Risks and Uncertainties
- [risk]
- [uncertainty]
- [unverified assumption]

## Verification Done
- [tests run]
- [manual checks]
- [not yet verified]

## Recommended Next Action
[one clear next step]

A handoff is weak if another person still has to rediscover the state of the work.

---

## 5. Share work in files, not only in chat

If work needs to be reviewed, continued, reused, or learned from, put it in a file or another durable artifact.

Good places:
- Azure DevOps work items
- PR descriptions
- investigation notes
- verification notes
- best-practice docs
- workflow docs
- reusable prompt files

Chat is good for discussion.
Files are better for continuity.

---

## 6. If something is a repeatable best practice, record it

When a useful pattern proves itself in real work, add it to the right place in this documentation repo.

Examples:
- repeated strong bug-fix pattern
- reliable review habit
- useful Copilot prompt shape
- recurring SQL/stored procedure caution
- Angular theme/layout rule
- regression testing lesson

Do not rely on team memory for repeatable practices.

---

## 7. If the same problem happens twice, document it

If the same mistake, gap, or failure happens twice, record it.

Document:
- what happened
- where it happened
- why it happened
- how it was fixed
- how to prevent it next time
- which file should be updated so the lesson becomes visible

When a problem repeats, it is no longer just a local incident.
It is a team learning signal.

---

## 8. If the same problem happens twice in a row, strengthen the system

Do not just fix the same class of problem again.

Instead, decide whether to update:
- a checklist
- a workflow
- a detailed guidance file
- a reusable prompt
- a repo-local instruction template

Repeated problems should improve the system, not only produce repeated fixes.

---

## 9. Write verification down

Verification should leave evidence.

Good verification notes include:
- what was tested
- how it was tested
- environment or data used
- what passed
- what failed
- what was not verified
- remaining risk

“Tested” is not enough.

---

## 10. Work should be restartable

Another developer or QA should be able to continue the work without starting from zero.

A restartable task state should make clear:
- the current status
- the current source of truth
- what was already done
- what remains
- what was verified
- what the next action is

If a task cannot be resumed without re-discovery, the handoff quality is weak.

---

## 11. Prefer one source of truth per topic

For each topic, keep one primary location.

Examples:
- shared AI guidance -> this documentation repo
- service-specific Copilot rules -> service repo `.github` files
- task progress -> Azure DevOps work item
- implementation/review summary -> PR description
- incident reasoning -> investigation note
- verification evidence -> verification note or PR

Do not split the same truth across many places without a clear reason.

---

## 12. Use AI to improve continuity, not reduce it

GitHub Copilot should help us:
- summarize work clearly
- create better handoff notes
- improve PR descriptions
- generate stronger verification notes
- identify repeated risk patterns
- turn repeated mistakes into documented guidance

It should not become an excuse for undocumented work.

---

## Final Rule

Good engineering work should be:
- understandable
- reviewable
- restartable
- transferable
- learnable

If the work cannot be continued, reviewed, or learned from, the process is incomplete.