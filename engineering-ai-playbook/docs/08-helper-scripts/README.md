# Helper Scripts

## Purpose

This section explains small, optional helper tools that support the playbook in daily work.

These tools should reduce friction, not replace judgment.

Use them to make continuity, handoff, and verification easier.

---

## Start Here

- Need a quick handoff or session summary draft? Read `save-work-context.md`.
- Want to use GitHub Copilot CLI hooks safely? Read `copilot-hooks.md`.

---

## Current Guidance

### `save-work-context.ps1`

Use this when you are pausing work, handing work over, or ending a session and need a usable markdown summary.

Read:
- `docs/08-helper-scripts/save-work-context.md`

### Copilot hooks

Use this when you want GitHub Copilot CLI to run a small command at key points such as session start, session end, or before a tool runs.

In this system, hooks should support good habits, not automate away real status and verification thinking.

Read:
- `docs/08-helper-scripts/copilot-hooks.md`

---

## Working Rules

- Prefer user-triggered helpers for important summaries and handoffs.
- Keep hook actions short, reliable, and easy to understand.
- Do not let hooks invent final status, verification, or risk notes automatically.
- Move final handoff or verification notes into the real source of truth for the work.

---

## Related Guidance

- `docs/00-overview/execution-and-handoff-rules.md`
- `docs/00-overview/where-to-record-what.md`
- `docs/05-checklists/definition-of-done.md`
