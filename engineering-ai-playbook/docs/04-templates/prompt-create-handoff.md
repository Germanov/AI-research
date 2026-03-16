# Create Handoff Prompt

## When to Use

Use this prompt when you need GitHub Copilot to help create a usable handoff note for unfinished or recently completed work.

It is intended for:
- interrupted implementation work
- paused investigations
- work moving to another developer or QA
- PR preparation
- Azure DevOps work item updates

---

## Prompt Template

```text
Help me create a concise but usable handoff note for this work.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Work context:
- Task or issue: [summary]
- Current state: [in progress / blocked / ready for review / ready for QA / done]
- Files touched: [files]
- What I already did: [steps]
- What remains: [remaining work]
- Risks or uncertainties: [risks]
- Verification already done: [verification]
- Links: [work item / PR / logs / screenshots]

Create the handoff in this structure:
1. Current Status
2. What Was Done
3. What Remains
4. Where to Continue
5. Risks and Uncertainties
6. Verification Done
7. Recommended Next Action

Important rules:
- Be specific.
- Do not write vague statements like "some progress made".
- Make the handoff usable by another person.
- State what is still unverified.
- Keep it concise but complete.
