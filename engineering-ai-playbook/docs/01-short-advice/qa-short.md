# QA Short Guidance

## Purpose

Use Copilot to improve precision, coverage, and review quality.

The goal is not to replace QA thinking.  
The goal is to make bug reports, regression checks, and review notes sharper and more complete.

---

## Core Rules

### Make bug reports stronger before implementation starts
Use AI to improve:
- repro steps
- expected versus actual behavior
- affected area
- environment or data conditions
- likely impact
- regression expectations

A vague bug report creates vague fixes.

### Be explicit about risk
For every bug or change, ask:
- what failed
- what else could fail for the same reason
- what contract or assumption may be affected
- what test should catch this next time

### Demand verification, not confidence
Do not accept “it should work.”

Look for evidence:
- reproduction resolved
- expected behavior confirmed
- regression checks completed
- edge cases considered
- verification notes recorded

### Review behavior, not just code
Even when developers used AI well, QA should still verify:
- actual user-visible behavior
- contract-sensitive behavior
- negative cases
- environment-sensitive behavior
- regression risk in nearby flows

---

## Backend-Focused QA Advice

- Check request and response behavior carefully.
- Watch for contract drift, status code changes, and validation changes.
- Be extra careful when the change touches SQL, stored procedures, or integration behavior.
- Treat data-shape changes as high risk.

---

## Frontend-Focused QA Advice

- Verify the actual screen behavior, not only the implementation summary.
- Check the custom theme usage and layout behavior.
- Test relevant screen sizes and responsive behavior.
- Check empty states, validation states, and error presentation.
- Review keyboard and focus behavior where relevant.

---

## Common Mistakes to Avoid

- Accepting incomplete repro steps
- Assuming the fix covers regression risk
- Verifying only the happy path
- Treating AI-generated summaries as evidence
- Missing nearby impacted areas because the main bug appears fixed

---

## What Good Looks Like

Strong QA support is:
- specific
- evidence-based
- risk-aware
- clear enough for another person to reproduce and verify

A good QA result explains:
- what was tested
- what was observed
- what remains uncertain
- what still needs attention