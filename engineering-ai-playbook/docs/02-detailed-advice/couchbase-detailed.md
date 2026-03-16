# Couchbase Detailed Guidance

## Purpose

This document defines how to use GitHub Copilot safely and effectively for Couchbase-related work in our environment.

It applies to:
- services using Couchbase
- document model access
- repository/query changes
- serialization and mapping behavior
- document-shape-sensitive logic
- bug fixes and reviews that touch Couchbase-backed behavior

The goal is to accelerate work without weakening correctness, document compatibility, maintainability, or production safety.

---

## 1. Core Position

Copilot can help with Couchbase-related engineering work, but it must be used carefully because document behavior is easy to misunderstand.

Use it to:
- understand existing document access patterns
- locate related repositories, mappers, and consumers
- draft narrow changes
- identify likely edge cases
- suggest regression scenarios
- summarize document-shape risks

Do not use it to:
- redesign document storage casually
- assume document behavior is equivalent to SQL behavior
- flatten missing/null/value distinctions without checking
- invent new document conventions beside existing ones
- make broad persistence changes with weak verification

Document-oriented persistence has different risks from relational persistence.  
Copilot often smooths over those differences too aggressively unless the prompt is precise.

---

## 2. What Must Be Treated as Intentional

In our environment, the following should be treated as deliberate until a task explicitly requires redesign:
- the choice to use Couchbase in a given service
- the existing document model
- current key conventions
- current serialization behavior
- existing repository/query patterns
- existing separation between Couchbase responsibilities and SQL responsibilities
- current consumer expectations about document shape

Copilot should not casually replace or reinterpret these choices.

---

## 3. Start With Document-Flow Understanding

Before changing Couchbase-related behavior, use Copilot to understand:
- how documents are keyed
- what fields are expected
- how documents are serialized and deserialized
- which code consumes the document
- what fields may be optional, missing, or versioned
- what similar access patterns already exist
- what tests or checks cover this path today

Questions to ask first:
- Where is this document type created and updated?
- What code reads it?
- Which fields are assumed to exist?
- Are missing and null treated differently?
- What key or lookup pattern is already used?
- What nearby code follows the same repository/query pattern?

Couchbase changes are safer when document assumptions are made explicit.

---

## 4. Prefer the Smallest Safe Document Change

Couchbase-related changes should be narrow and deliberate.

Prefer:
- small field-level adjustments
- targeted serialization or mapping fixes
- local query corrections
- explicit compatibility handling
- controlled reader/writer updates

Avoid:
- broad document redesign during a bug fix
- changing document shape without checking all consumers
- rewriting repository patterns without need
- treating Couchbase code like generic JSON manipulation

Small changes are easier to:
- reason about
- validate
- review
- explain to QA and reviewers
- roll back if needed

---

## 5. Document Shape Is a Contract

Even when not formally versioned, a document shape often behaves like a contract.

Changes to:
- field presence
- field names
- nullability
- default values
- nested structure
- array contents
- serialization rules

can break consumers quietly.

When using Copilot on Couchbase code, explicitly review:
- what the reader expects
- what the writer produces
- whether missing and null behave differently
- whether existing documents in storage still remain compatible
- whether downstream mapping logic assumes an older shape

This is one of the main risk boundaries in document-backed services.

---

## 6. Missing vs Null vs Default Values

This is a common source of subtle bugs.

Copilot-generated code may treat these as equivalent when they are not.

Be careful with:
- missing fields
- null fields
- default values introduced during deserialization
- optional nested structures
- arrays that may be absent or empty

When reviewing or generating code, ask:
- Does the consumer distinguish missing from null?
- What happens with older documents that lack this field?
- Are we relying on default values silently?
- Could this mapping hide a backwards-compatibility issue?

Any change involving optional data should be reviewed with this distinction in mind.

---

## 7. Repository and Query Pattern Consistency

Copilot should follow the existing repository/query style already used by the service.

Prefer:
- the established access path
- consistent document mapping
- current serialization conventions
- current key patterns
- current error-handling and fallback behavior

Avoid introducing:
- alternate repository styles for similar data
- inconsistent document access logic
- one-off mapping patterns
- ad hoc field fallback rules scattered across the codebase

Consistency matters because document systems become harder to reason about when conventions drift.

---

## 8. Couchbase Is Not SQL

A major risk in AI-assisted code generation is treating Couchbase like relational storage with different syntax.

Do not let Copilot casually assume:
- query semantics are equivalent
- joins or relationships behave the same way
- null/missing behavior maps directly
- schema discipline works the same way
- data integrity assumptions are identical

Questions to ask:
- Are we relying on relational assumptions in a document model?
- Are we assuming fields always exist?
- Are we assuming shape consistency across all documents?
- Are we reading old and new document versions safely?

The persistence model matters.  
Copilot must be constrained to respect it.

---

## 9. Verification Expectations

Couchbase-related work requires explicit compatibility and behavior checks.

Verification may include:
- integration tests
- deserialization checks
- representative document checks
- reader/writer compatibility checks
- null/missing-field checks
- query validation
- API behavior validation if the document feeds an API
- build success
- manual checks of realistic scenarios

### Strong verification examples
- confirmed older documents still deserialize safely
- verified new field handling when field is missing, null, and present
- validated consumer behavior with representative document shape
- checked query output against expected mapping behavior
- verified no unintended change in downstream API behavior

### Weak verification examples
- “document loads”
- “serialization works”
- “seems fine”
- “Copilot generated the mapping”

The farther a document shape reaches through the system, the stronger the compatibility evidence should be.

---

## 10. Bug-Fix Guidance

For Couchbase-related defects, the preferred sequence is:

1. Reproduce or establish evidence
2. Identify whether the failure is in:
   - document shape
   - serialization
   - lookup/key behavior
   - mapping
   - query logic
   - consumer assumptions
3. Clarify expected behavior
4. Find the smallest safe fix
5. Verify old and new document compatibility where relevant
6. Check nearby flows that rely on the same shape or repository pattern

A common mistake is fixing only the visible null/error symptom while leaving the underlying compatibility issue unresolved.

Copilot can help identify nearby code paths, but the developer must still validate the actual persistence behavior.

---

## 11. PR and Review Guidance

A strong Couchbase-related PR should explain:
- what document-related behavior changed
- whether document shape changed
- whether reader/writer compatibility was considered
- whether missing/null/default handling changed
- which consumers were checked
- how the change was verified

Reviewers should look for:
- hidden document-shape drift
- incorrect assumptions about optional fields
- relational assumptions leaking into document logic
- inconsistent repository/query style
- weak compatibility handling
- unverified downstream consumer impact

If a reviewer cannot tell whether existing documents remain safe, the PR needs more work.

---

## 12. Common Anti-Patterns

Avoid:
- treating Couchbase documents like strongly uniform relational rows
- assuming missing and null are equivalent
- changing document shape without checking readers
- scattering fallback/default logic inconsistently
- mixing persistence redesign with ordinary bug fixes
- introducing one-off repository patterns
- trusting generated serialization code without compatibility review
- using AI to create document logic nobody can clearly explain

---

## 13. What Good Looks Like

A strong Couchbase-related AI-assisted change is:
- narrow in scope
- explicit about document-shape impact
- careful about missing/null/default behavior
- consistent with existing repository and serialization patterns
- verified against representative documents or consumers
- clearly explained to reviewers and QA

If a change touches documents but nobody can clearly explain compatibility with existing stored data, it is not ready.