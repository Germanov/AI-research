# Start Simple

## 1. Purpose

This is the quick-start guide for using GitHub Copilot and this playbook in real work.

Read this first if you want to start now without reading the whole repository.

The goal is simple: use Copilot to help you make smaller, clearer, better-verified changes.

---

## 2. If You Do Only 3 Things

### 1. Leave a real handoff

- What to do: When work may continue later, move to another person, or needs review or QA context, leave a handoff using the defined structure.
- Why it matters: Good work is restartable, reviewable, and transferable. Important context should not stay only in chat.
- Where to find it:
  - `docs/00-overview/execution-and-handoff-rules.md`
  - `docs/04-templates/prompt-create-handoff.md`
  - `docs/06-examples/example-good-handoff.md`

### 2. Write verification notes

- What to do: Record what you tested, how you tested it, what passed, what was not checked, and what risk remains.
- Why it matters: “Tested” is not evidence. Verification notes help reviewers, QA, and future you trust the result.
- Where to find it:
  - `docs/00-overview/execution-and-handoff-rules.md`
  - `docs/05-checklists/definition-of-done.md`
  - `docs/06-examples/example-good-verification-notes.md`

### 3. Use a prompt template instead of a vague prompt

- What to do: Start from the closest reusable prompt, then fill in the task, constraints, existing patterns to preserve, and verification path.
- Why it matters: Better prompts produce smaller, safer, more relevant output.
- Where to find it:
  - `docs/04-templates/README.md`
  - `docs/04-templates/`

---

## 3. If You Do Only 5 Things

After the three rules above, add these two habits:

### 4. Ask questions before asking for code

- What to do: First ask Copilot to find existing patterns, related files, likely risks, and current tests before you ask it to implement.
- Why it matters: Understanding first reduces wrong-turn code generation and scope creep.
- Where to find it:
  - `docs/00-overview/decision-rules.md`
  - `docs/01-short-advice/developers-short.md`
  - `docs/01-short-advice/qa-short.md`

### 5. Keep changes small and reviewable

- What to do: Make the smallest safe change. Avoid mixing the real task with cleanup, refactoring, or extra invention unless it is clearly needed.
- Why it matters: Small changes are easier to review, verify, explain, and roll back.
- Where to find it:
  - `docs/00-overview/decision-rules.md`
  - `docs/05-checklists/definition-of-done.md`
  - `docs/03-workflows/`

---

## 4. How to Work With Copilot (Daily Flow)

1. **Understand the task**
   - Clarify the goal, expected behavior, constraints, and what must not change.
   - If the area is unfamiliar, ask Copilot questions about existing patterns before asking for code.

2. **Use a prompt template**
   - Open the closest prompt in `docs/04-templates/`.
   - Fill in the real task, scope, constraints, risks, and verification plan.

3. **Implement the smallest safe change**
   - Reuse existing patterns.
   - Keep the diff narrow.
   - Avoid broad rewrites unless the task truly requires them.

4. **Verify explicitly**
   - Run the relevant checks.
   - Do manual verification when behavior matters.
   - Write down what you checked, what you did not check, and any remaining risk.

5. **Write handoff or PR notes**
   - If the work continues later, leave a handoff.
   - If the work is done, leave a summary that explains what changed and how it was verified.

---

## 5. Where to Find Things

- Rules and operating guidance → `docs/00-overview/`
- Prompts → `docs/04-templates/`
- Workflows → `docs/03-workflows/`
- Checklists → `docs/05-checklists/`
- Examples → `docs/06-examples/`
- Lessons learned → `docs/07-lessons-learned/`

---

## 6. Common Mistakes to Avoid

- Trusting Copilot output without verifying it
- Using vague prompts instead of a reusable template
- Starting implementation before understanding the existing pattern
- Making one large change instead of one small safe change
- Writing “tested” without saying what was actually checked
- Skipping regression thinking and nearby impact checks
- Failing to leave handoff or PR notes that another person can actually use
- Letting repeated mistakes stay undocumented

---

## 7. Final Rule

This system is useful only if you actually use it in daily work.
