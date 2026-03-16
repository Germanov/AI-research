# Incident Investigation Workflow

## Purpose

This workflow defines how to investigate production incidents or serious defects in a structured, disciplined way using GitHub Copilot as a support tool.

The goal is to improve clarity, speed, and reasoning quality without replacing human judgment.

---

## When to Use This Workflow

Use this workflow for:
- production incidents
- severe service degradation
- recurring defects with unclear cause
- intermittent failures
- data correctness incidents
- UI failures with unclear reproduction
- integration failures
- post-incident analysis and follow-up

---

## Preconditions

Before starting, collect as much of the following as possible:
- incident summary
- time window
- impacted service, screen, flow, or integration
- observed symptoms
- logs, screenshots, traces, or payloads
- user impact
- environment details
- recent changes if known
- current mitigation or workaround if any

If evidence is incomplete, start with what is known and state the gaps explicitly.

---

## Step-by-Step Workflow

### 1. Define the incident clearly
State:
- what happened
- where it happened
- when it happened
- who or what was affected
- what the current impact is

Do not begin deep reasoning until the incident statement is clear enough to share with another engineer.

### 2. Separate facts from assumptions
Create two lists:

Facts:
- observed errors
- confirmed affected systems
- confirmed time range
- confirmed user or system impact
- known reproductions or logs

Assumptions:
- likely cause
- likely affected component
- possible recent trigger
- estimated blast radius

This step prevents false certainty.

### 3. Bound the blast radius
Ask:
- which services or screens are confirmed affected?
- is this isolated or systemic?
- does it affect all users or a subset?
- does it affect one environment or several?
- is it contract, UI, data, or infrastructure related?
- what adjacent systems may consume the same behavior?

### 4. Identify likely failure layers
Use Copilot and normal engineering analysis to narrow the failure area.

Common layers:
- frontend rendering or state
- API contract or validation behavior
- service logic
- integration layer
- SQL query or stored procedure behavior
- Couchbase document shape or access
- configuration or environment-sensitive behavior
- authentication or authorization
- deployment/config drift

### 5. Build ranked hypotheses
Do not jump straight to one cause.

List a small set of plausible hypotheses and rank them by:
- consistency with the facts
- blast radius fit
- time correlation
- simplicity
- known recent changes
- log or trace support

A good investigation prefers ranked hypotheses over one confident guess.

### 6. Test the hypotheses
For each serious hypothesis, ask:
- what evidence would support it?
- what evidence would disprove it?
- what quick checks can be run safely?
- what code paths or logs should be examined?

Use Copilot to help map likely paths, consumers, and assumptions, but verify with real evidence.

### 7. Identify the most likely root cause
Once evidence supports a cause strongly enough, document:
- what failed
- why it failed
- what assumption broke
- what behavior exposed it
- what nearby areas may share the same weakness

If root cause is still uncertain, say so clearly and document the strongest current hypothesis.

### 8. Decide mitigation versus fix
Separate:
- immediate mitigation
- safe rollback if applicable
- narrow corrective fix
- longer-term preventive improvement

Do not let incident response become an uncontrolled redesign unless that is explicitly justified.

### 9. Define verification for the fix
Before shipping a corrective change, define:
- what evidence will show the incident is resolved
- what adjacent regressions should be checked
- what logs or metrics should be monitored after deployment
- what remains uncertain

### 10. Capture follow-up actions
Record:
- root cause
- corrective action
- regression checks needed
- missing monitoring or test coverage
- documentation or process gaps
- lessons learned worth preserving

---

## Verification and Evidence

Strong incident investigation evidence includes:
- logs tied to the incident window
- reproducible or semi-reproducible behavior
- traces or payload evidence
- consistent correlation between hypothesis and observation
- explicit confirmation of what is known versus assumed

Weak evidence includes:
- “this seems likely”
- “Copilot suggested this”
- “we changed it and the error stopped”
- “we could not reproduce, so it is probably fixed”

---

## Exit Criteria

The workflow is complete when:
- the incident is clearly described
- facts and assumptions were separated
- the likely root cause is identified or uncertainty is explicitly documented
- mitigation or fix strategy is clear
- verification criteria for resolution are defined
- follow-up actions are captured

---

## Common Failure Modes

- jumping to a favorite theory too early
- treating assumptions as facts
- widening the fix into redesign during incident pressure
- failing to bound the blast radius
- under-checking adjacent systems
- closing the incident without a credible verification plan
- relying on AI-generated explanations without evidence