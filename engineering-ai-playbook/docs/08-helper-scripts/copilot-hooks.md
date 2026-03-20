# Copilot Hooks

## Purpose

This guide explains how to use GitHub Copilot CLI hooks in a way that matches this playbook.

Hooks are optional.

Use them to reinforce good habits, not to replace thinking.

---

## What Hooks Are

Hooks let GitHub Copilot CLI run small shell commands at key points during a session.

Useful hook types include:

- `sessionStart`
- `sessionEnd`
- `userPromptSubmitted`
- `preToolUse`
- `postToolUse`
- `errorOccurred`

For Copilot CLI, hook files are loaded from `.github/hooks/` in the current working directory.

For Copilot coding agent on GitHub, the hook configuration must also exist on the repository default branch.

---

## When Hooks Are Useful In This System

Good use cases:

- remind yourself to review repo instructions or a local continuity note when a session starts
- remind yourself to save work context when a session ends
- log prompt or session events for a lightweight local audit trail
- add small policy checks in high-risk repositories
- capture basic failure context when a session exits unexpectedly

Bad use cases:

- auto-writing final handoff notes with invented detail
- maintaining a single shared session-memory file through hook automation
- pretending hook data is enough to describe real verification
- running long or fragile scripts that slow normal work
- hiding important decisions inside automation

---

## Recommended Rule For `save-work-context`

Use `scripts/save-work-context.ps1` as a manual step.

The safest pattern is:

1. use a hook to remind you
2. run `.\scripts\save-work-context.ps1` yourself
3. review and tighten the markdown
4. move the final summary into the real source of truth if needed

Do **not** treat raw hook metadata as a full handoff.

Hook input can tell you that a session started, ended, failed, or resumed.

It cannot reliably tell you:

- what was truly completed
- what still remains
- what was actually verified
- what risk still matters

That part still needs human judgment.

---

## Minimal Setup

1. Create `.github/hooks/` in the repository where you use Copilot CLI.
2. Add a JSON file such as `.github/hooks/hooks.json`.
3. Start with one small hook.
4. Keep `timeoutSec` short unless you have a strong reason not to.

Basic shape:

```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": []
  }
}
```

---

## Example: Session-End Reminder To Run `save-work-context`

This example keeps the important step manual while still nudging the user at the right time.

```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": [
      {
        "type": "command",
        "powershell": "if (Test-Path '.\\scripts\\save-work-context.ps1') { Write-Host 'Copilot session ended. If this work needs a handoff or session summary, run .\\scripts\\save-work-context.ps1 before switching tasks.' }",
        "cwd": ".",
        "timeoutSec": 5
      }
    ]
  }
}
```

Why this is a good starting pattern:

- it is small
- it is easy to understand
- it does not invent status or verification
- it reinforces the continuity rule at the right moment

---

## When To Use A Wrapper Script

If you later want a hook to create a draft file automatically, use a **separate non-interactive wrapper** instead of calling `save-work-context.ps1` directly with missing values.

That wrapper should:

- read hook JSON from stdin
- create only a draft or reminder artifact
- use explicit placeholders for unknown sections
- stay honest about what is still unverified
- never pretend the handoff is complete

Keep `save-work-context.ps1` as the reviewed, user-facing step.

---

## Good Hook Choices For This Playbook

| Hook | Good use | Avoid |
|---|---|---|
| `sessionStart` | small session log, reminder to review repo instructions or a continuity note | heavy startup automation |
| `sessionEnd` | remind the user to run `save-work-context.ps1` | auto-writing final handoff text |
| `userPromptSubmitted` | local prompt logging in controlled environments | collecting sensitive prompt data without review |
| `preToolUse` | narrow policy checks for risky tools | broad blocking rules before the team is ready |
| `postToolUse` | simple metrics or audit logging | slow follow-up analysis |
| `errorOccurred` | capture failure context | noisy or fragile alerting |

---

## Practical Notes

- Validate the hook JSON carefully.
- On Windows, prefer PowerShell commands or PowerShell scripts.
- Keep hook output simple and predictable.
- If a hook needs to return JSON, use `ConvertTo-Json -Compress`.
- If a hook becomes hard to explain, it is probably doing too much.

---

## Related Guidance

- `docs/08-helper-scripts/README.md`
- `docs/08-helper-scripts/save-work-context.md`
- `docs/00-overview/execution-and-handoff-rules.md`
- `docs/00-overview/where-to-record-what.md`

## Official References

- `https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/use-hooks`
- `https://docs.github.com/en/copilot/reference/hooks-configuration`
