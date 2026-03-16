# Incident Root Cause Prompt

## When to Use

Use this prompt when investigating a production issue, severe bug, recurring defect, or unclear failure with GitHub Copilot.

It is intended for:
- incident triage
- root-cause analysis
- severe backend or frontend defects
- integration failures
- data correctness investigations
- post-incident reasoning support

---

## Prompt Template

```text
Help me investigate this incident or severe defect in a disciplined way.

Context:
- Tooling and workflow: [Azure DevOps / GitHub / other]
- Repository or application type: [backend service / frontend app / shared library / other]
- Tech stack: [stack]
- Existing architecture or framework patterns to preserve: [patterns]
- Design system or UI constraints: [if any]
- Data or persistence constraints: [if any]
- Team expectations: [smallest safe change / no unnecessary refactoring / explicit verification / other]

Incident context:
- Affected area: [service / endpoint / screen / integration]
- Incident summary: [summary]
- Observed symptoms: [symptoms]
- Time window: [time window]
- Known impact: [impact]
- Logs, traces, payloads, screenshots, or repro details: [optional]
- Recent changes if known: [optional]
- Current mitigation or workaround: [optional]

Your task:
1. Separate facts from assumptions.
2. Identify the likely blast radius.
3. Suggest the most plausible failure layers.
4. Build a short ranked list of root-cause hypotheses.
5. Suggest what evidence would support or disprove each hypothesis.
6. Recommend the safest next investigation steps.
7. Suggest what should be verified before declaring the incident resolved.
8. If root cause is still uncertain, say so clearly.

Important rules:
- Do not pretend certainty when evidence is incomplete.
- Do not jump to a single explanation too early.
- Be explicit about data, contract, UI, and integration risks where relevant.
- Prefer a small number of strong hypotheses over many weak ones.
- Keep the output practical for incident response and follow-up.

Return your answer in this structure:
1. Facts
2. Assumptions
3. Blast radius
4. Ranked hypotheses
5. Evidence to check
6. Recommended next steps
7. Resolution verification plan
8. Open uncertainties
