# QA Detailed Guidance

## Purpose

This document defines how QA engineers should use GitHub Copilot to improve test thinking, bug reporting, verification quality, and review depth.

Copilot should make QA work more precise and more structured.  
It should not replace critical thinking, exploratory judgment, or evidence-based verification.

These guidelines apply to:
- bug reporting
- regression planning
- story and acceptance criteria review
- PR verification
- risk assessment
- frontend and backend validation
- AI-assisted QA support in Azure DevOps-based workflows

---

## 1. How QA Should Think About Copilot

Copilot is useful for sharpening QA work, not automating trust.

Use it to:
- improve bug-report clarity
- identify missing edge cases
- propose stronger regression scenarios
- compare expected behavior against implementation notes
- summarize likely risk areas
- structure PR verification
- turn vague issues into testable statements

Do not use it to:
- replace real verification
- invent confidence without evidence
- accept generated test cases uncritically
- treat developer summaries as proof
- reduce exploratory thinking to prompt-following

A good QA workflow uses Copilot to make thinking clearer.  
A weak QA workflow uses Copilot to sound thorough without actually being thorough.

---

## 2. QA’s Role in an AI-Assisted Team

As AI-assisted implementation becomes more common, QA becomes more important, not less.

Why:
- AI can produce plausible but incomplete fixes
- AI can miss contract-sensitive behavior
- AI can overfit to happy paths
- AI can produce code that looks finished before it is truly verified
- AI-generated summaries can sound more certain than the evidence supports

QA should act as a stabilizing force by insisting on:
- reproducibility
- explicit expected behavior
- evidence-backed validation
- regression thinking
- clarity about what remains uncertain

---

## 3. Strong Bug Reports Come Before Strong Fixes

A large percentage of weak fixes start with weak bug reports.

Before implementation starts, QA should aim to provide:
- clear repro steps
- expected behavior
- actual behavior
- affected screen, flow, service, or endpoint
- environment or configuration details
- data conditions when relevant
- severity or impact
- screenshots, logs, request examples, or payload samples where useful

### Why this matters
If the problem statement is vague, the resulting fix is often vague too.

AI can help improve a bug report by asking:
- What exact steps reproduce this?
- What is the expected result?
- What result actually occurred?
- Does this happen always or only under some conditions?
- What environment or input matters?
- What would count as a verified fix?

That is a good use of Copilot for QA.

---

## 4. Make Expected Behavior Explicit

A bug is not well-defined until the expected behavior is explicit.

Sources of expected behavior may include:
- acceptance criteria
- current product rules
- existing contracts
- existing screen behavior
- business rules
- user workflows
- prior implementation patterns

QA should not allow ambiguous expectations to survive into implementation unless the ambiguity is clearly flagged.

### Useful habit
When reviewing a bug or story, try to rewrite the behavior as:
- “Given [context], when [action], then [expected result].”

This makes both testing and implementation more reliable.

---

## 5. Use AI to Strengthen Regression Thinking

One of the best uses of Copilot for QA is to help identify what else could be affected by the same root cause.

Helpful regression questions:
- What nearby flows share the same assumption?
- What other inputs hit the same validation path?
- What other screens or endpoints use the same contract?
- What related empty, null, or error cases should be checked?
- What related permissions, roles, or states could expose the same weakness?

AI can help generate candidate scenarios, but QA must still judge which ones are real risks.

### Example
If a backend bug was caused by a null-handling issue in a shared mapper, regression risk may exist in:
- similar endpoints using the same mapper
- different payload variants
- edge-case database results
- UI screens consuming the same response shape

The original bug being fixed does not mean the regression surface is covered.

---

## 6. Backend-Oriented QA Guidance

### 6.1 Treat contracts as high risk
For backend validation, pay close attention to:
- request schema
- response schema
- status codes
- validation errors
- serialization behavior
- error messages or formats where contract-sensitive
- integration payload shape
- empty/null handling

AI-assisted implementation can accidentally preserve internal correctness while changing public behavior.

### 6.2 Be extra careful around data boundaries
Changes touching:
- SQL queries
- stored procedures
- Entity Framework mappings
- integration logic
- Couchbase document structure
- configuration-sensitive behavior

deserve deeper review.

Questions QA should ask:
- Did the result shape change?
- Did ordering or filtering change?
- Could null or missing data behave differently now?
- Did parameter behavior change?
- Does the consuming layer still handle the data correctly?

### 6.3 Stored procedure changes need explicit validation
For stored-procedure-related changes, QA should expect evidence for:
- correct inputs
- correct outputs
- compatibility with the consuming code
- behavior under edge or empty conditions
- behavior under realistic data

Because stored procedures often exist for complexity or performance reasons, they should not be treated as low-risk implementation detail.

---

## 7. Frontend-Oriented QA Guidance

### 7.1 Verify real behavior, not just screen appearance
Frontend verification should include:
- what the user sees
- what the user can do
- what happens when things go wrong
- whether layout and interaction remain consistent with the system

QA should not stop at “the page renders.”

### 7.2 Respect the design system in verification
Our Angular custom theme and approved layout helpers are part of expected behavior.

QA should check whether a change:
- uses the shared patterns correctly
- preserves alignment and spacing expectations
- behaves properly across relevant screen sizes
- avoids UI inconsistency with adjacent screens
- handles validation and feedback in the approved way

### 7.3 Check non-happy-path states
Frontend regressions often hide in:
- empty states
- loading states
- validation states
- error states
- permission-driven states
- interaction edge cases
- keyboard/focus paths

AI-generated UI changes often appear correct in the main path while being weaker in these states.

---

## 8. PR Verification Guidance

QA review of a PR should answer:
- What problem is this PR solving?
- What changed in user-visible or contract-visible behavior?
- What evidence exists that it works?
- What related risk areas should be checked?
- What remains uncertain?

### Signs of a strong PR
- clear problem statement
- controlled scope
- clear verification notes
- visible link between change and expected behavior
- explicit mention of risk areas
- test updates where appropriate

### Signs of a weak PR
- vague summary
- no evidence beyond “tested locally”
- no mention of risk
- large diff with limited explanation
- unclear boundary impact
- strong confidence but weak proof

QA should be willing to ask for clearer evidence.

---

## 9. Verification Notes Should Be Explicit

One of the most valuable QA habits is writing verification notes that another person could follow.

Strong notes usually include:
- what build/environment was used
- what steps were performed
- what data or inputs were used
- what result was observed
- what related scenarios were checked
- what was not checked

Weak notes:
- “works fine”
- “verified”
- “looks good”

Strong notes:
- “Reproduced issue using [steps]. After fix, repeated with same inputs and confirmed [expected result]. Also checked [related scenario]. Did not verify [unavailable condition].”

This is especially important in AI-assisted workflows because AI summaries can sound more complete than the actual evidence.

---

## 10. Use Copilot to Improve Test Design, Not Just Test Volume

AI can help produce many test ideas quickly.  
That is not the same as producing good test coverage.

QA should prefer:
- fewer strong scenarios
- explicit risk-based coverage
- boundary-aware tests
- contract-sensitive tests
- regression-relevant tests

Avoid relying on AI-generated test ideas that:
- only mirror implementation detail
- ignore user or contract behavior
- miss state/permission/data variation
- create long test lists with weak value

Good AI-assisted test design still requires human prioritization.

---

## 11. Collaboration With Developers

QA should use Copilot to make collaboration tighter, not looser.

Helpful collaboration outputs:
- clearer bug reports
- sharper repro steps
- explicit regression questions
- structured verification feedback
- focused PR comments
- risk-based follow-up questions

Useful questions to raise:
- What contract is most at risk here?
- What related scenario should be checked?
- What evidence shows the bug is actually fixed?
- What is still unverified?
- What would break if this assumption is wrong?

Good QA collaboration reduces ambiguity for developers and reviewers.

---

## 12. Common Anti-Patterns

Avoid:
- accepting AI-generated bug summaries as evidence
- reviewing only the happy path
- assuming a passing build equals verified behavior
- under-specifying expected behavior
- skipping regression thinking because the main issue is fixed
- trusting PR descriptions that sound complete but do not show proof
- failing to record what was not verified
- using AI to generate many test ideas without filtering for relevance

---

## 13. What Good Looks Like

A strong QA workflow with Copilot produces:
- clearer bug definitions
- better acceptance and regression thinking
- stronger verification notes
- sharper PR review feedback
- more explicit handling of risk and uncertainty

A strong QA engineer uses AI to make their reasoning more structured and more communicable.  
A weak workflow uses AI to make incomplete verification sound complete.

The quality bar remains the same:
- reproducibility
- clarity
- evidence
- risk awareness
- honest communication