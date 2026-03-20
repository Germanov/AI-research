# Save Work Context Script

## Purpose

This helper script creates a markdown work-context file before you switch tasks, stop for the day, or hand work to another person.

It supports the playbook rule that work should be restartable and handoff-ready.

It does not replace the primary artifact for the work. If a PR, work item, or investigation note already exists, move the final summary there as well.

Use it to preserve the current in-progress state honestly, including blockers.

---

## Script Location

`scripts/save-work-context.ps1`

---

## When to Use It

Use this script when:

- you are pausing a task and do not want to lose context
- another developer or QA engineer may continue the work
- you have partial verification and need to record exactly what was checked
- you want a fast first draft before updating a PR description or work item

Do not use it as a substitute for thinking. Review the generated file and tighten it before sharing it.

---

## Using It With Copilot Hooks

This script is designed to be run manually.

That is the recommended default.

If you use Copilot CLI hooks, the best pattern is to use a `sessionEnd` hook to remind yourself to run `.\scripts\save-work-context.ps1`.

Avoid calling this script directly from a hook unless you pass all required values yourself through a separate non-interactive wrapper.

Why:

- this script asks for real task state
- it expects honest remaining-work notes
- it expects explicit verification notes
- raw hook metadata is not enough to produce a strong handoff on its own

See `docs/08-helper-scripts/copilot-hooks.md` for a practical hook setup.

---

## What It Captures

The script writes a markdown file with the handoff structure used in this playbook:

- `Current Status`
- `What Was Done`
- `What Remains`
- `Blockers`
- `Where to Continue`
- `Risks and Uncertainties`
- `Verification Done`
- `Recommended Next Action`

It also records:

- generation time
- repository name
- working directory

---

## Basic Usage

Run it interactively from the repository where you are working:

```powershell
.\scripts\save-work-context.ps1
```

The script will prompt you for the missing fields and then create a markdown file in:

```text
.\work-context\
```

---

## Example With Parameters

Use parameters when you already know the main details:

```powershell
.\scripts\save-work-context.ps1 `
  -Title "Order details null display name bugfix" `
  -Status "Ready for QA" `
  -WorkItem "ADO-14231" `
  -MainFiles "order-details.component.ts","customer-display.helper.ts" `
  -WhatWasDone "Reproduced the bug","Implemented a local fallback","Checked the API contract was unchanged" `
  -WhatRemains "Verify sibling UI flows","Decide whether the fallback should stay local" `
  -BlockedItems "Waiting for product decision on whether the fallback should be shared" `
  -RisksAndUncertainties "Shared helper may affect another screen" `
  -VerificationDone "Build passed","Manual check completed on historical order ORD-104882" `
  -RecommendedNextAction "Verify order summary and search results before opening the PR"
```

---

## Output Behavior

- If you do not provide `-OutputPath`, the script creates a timestamped file in `.\work-context\`.
- If you do provide `-OutputPath`, the script writes to that exact path and creates the parent folder if needed.
- If Git is available and the current directory is inside a repository, the current branch is detected automatically.
- If a field is missing, the script prompts for it or uses an explicit placeholder instead of silently hiding the gap.

Recommended defaults:

- keep `work-context/` local or gitignored in shared repositories
- use one file per task, branch, or timestamped pause
- avoid one shared file that gets rewritten at the end of every session

This is intentional. The goal is to create a usable handoff, not a vague summary.

---

## Suggested Folder Structure

Use this pattern in a product repo or local working folder:

```text
repo-root/
├─ scripts/
│  └─ save-work-context.ps1
├─ docs/
│  └─ 08-helper-scripts/
│     └─ save-work-context.md
└─ work-context/
   ├─ 2026-03-18_173000_order-details-null-display-name-bugfix.md
   └─ 2026-03-18_181500_checkout-regression-follow-up.md
```

Notes:

- `scripts/` contains small, explicit helper tools.
- `docs/08-helper-scripts/` explains how to use them.
- `work-context/` is optional. Use it for local handoff drafts and continuity notes.
- If these files should stay local, ignore the folder in the product repo.
- In multi-person repositories, prefer local or gitignored continuity files over a single shared mutable note.

## Recommended Naming

Use names that make the note operational, not generic.

Good examples:
- `2026-03-18_173000_order-details-null-display-name-bugfix.md`
- `feature-branch-handoff.md`
- `current-task-context.md`

Avoid vague names such as `primer.md` for live task state.

---

## Recommended Daily Flow

1. Start or refresh the note when work becomes non-trivial.
2. Update it when a major decision changes the plan or a blocker appears.
3. Pause before switching tasks and refresh the note again.
4. Tighten the markdown so it is specific and honest about risk.
5. Move or copy the final summary into the real source of truth for the work:
   - work item
   - PR description
   - investigation note
6. Keep the local file if it still helps continuity.

---

## Related Guidance

- `docs/08-helper-scripts/README.md`
- `docs/08-helper-scripts/copilot-hooks.md`
- `docs/00-overview/execution-and-handoff-rules.md`
- `docs/00-overview/where-to-record-what.md`
- `docs/04-templates/prompt-create-handoff.md`
- `docs/06-examples/example-good-handoff.md`
