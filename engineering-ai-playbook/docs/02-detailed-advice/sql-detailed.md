# SQL Detailed Guidance

## Purpose

This document defines how to use GitHub Copilot safely and effectively for SQL-related work in our environment.

It applies to:
- SQL-backed services
- Entity Framework data access
- stored procedures
- query changes
- result-shape-sensitive logic
- database-impacting bug fixes and reviews

The goal is to move faster without weakening correctness, compatibility, performance awareness, or maintainability.

---

## 1. Core Position

Copilot can help with SQL-related engineering work, but it should never be trusted blindly around data behavior.

Use it to:
- understand existing query patterns
- identify related mappings and consumers
- draft focused changes
- summarize likely impact areas
- suggest test scenarios
- help review query and result-shape behavior

Do not use it to:
- redesign data access casually
- replace intentional stored procedure usage without explicit direction
- treat database changes like ordinary refactoring
- assume generated queries are correct because they compile
- infer performance safety without validation

Database-facing changes have a wider blast radius than they first appear.  
That means correctness and compatibility matter more than generation speed.

---

## 2. What Must Be Treated as Intentional

In our environment, the following should be treated as deliberate architectural choices unless the task explicitly says otherwise:
- SQL as the persistence layer for the service
- Entity Framework for regular data access
- stored procedures for complex or performance-sensitive queries
- current table/query/result-shape contracts
- existing mapping logic in code
- current separation between SQL and Couchbase responsibilities

Copilot should not be allowed to casually replace those choices with generic alternatives.

---

## 3. Start With Data-Flow Understanding

Before changing SQL-related logic, use Copilot to understand:
- where the data originates
- how it is queried
- how it is transformed
- what code consumes the result
- what assumptions exist about ordering, nulls, and cardinality
- what existing tests or checks cover the behavior

Questions to ask first:
- Where is the current query or stored procedure used?
- Which code maps this result into domain or response objects?
- What fields are assumed to be present?
- What ordering or filtering behavior is relied upon?
- Are null, empty, or missing results already handled?
- What similar queries already exist in the service?

SQL changes are safer when the full usage path is understood.

---

## 4. Prefer the Smallest Safe Data Change

Database-impacting changes should be as narrow as possible.

Prefer:
- targeted query corrections
- minimal result-shape changes
- local fixes to filtering or joins
- explicit parameter corrections
- small mapper changes paired with verification

Avoid:
- mixing SQL changes with unrelated service refactoring
- changing both query semantics and consumer logic without calling it out
- broad “cleanup” of working query code
- hidden changes in result cardinality, ordering, or null behavior

A small SQL change is easier to:
- validate
- review
- explain
- rollback
- correlate with downstream behavior

---

## 5. Entity Framework Guidance

### 5.1 Use EF for normal access patterns
Entity Framework remains the standard path for regular data access where the service already uses it.

When Copilot generates or modifies EF code, review carefully for:
- filtering correctness
- projection correctness
- join behavior
- null handling
- ordering assumptions
- aggregation semantics
- accidental multiple queries
- over-fetching
- under-fetching
- mapping compatibility

Do not assume “looks normal” means “is safe.”

### 5.2 Review semantics, not just syntax
A generated EF query may compile and still be wrong because of:
- incorrect filter placement
- wrong operator choice
- incorrect relationship traversal
- mistaken default handling
- changed ordering
- unexpected cardinality
- incorrect grouping

The review question is not “does this run?”  
It is “does this preserve intended data behavior?”

### 5.3 Keep query style consistent
Copilot should follow the existing query style already used in the service where practical.

Avoid introducing:
- inconsistent projection patterns
- parallel mapping styles
- mixed conventions within similar code paths
- extra abstraction without need

Consistency matters because it improves maintainability and reviewability.

---

## 6. Stored Procedure Guidance

### 6.1 Treat stored procedures as first-class architecture
Where stored procedures are already used for complexity or performance reasons, they are part of the system design.

Copilot should not:
- bypass them casually
- duplicate their logic in application code
- replace them with EF just because it looks simpler in isolation
- treat them as accidental legacy by default

### 6.2 Stored procedure changes require stronger review
When a change touches a stored procedure or its consumer, review:
- parameter list
- parameter meaning
- output shape
- nullable fields
- column naming expectations
- ordering expectations
- edge-case behavior
- empty-result behavior
- compatibility with the calling code

Because stored procedures often sit at important boundaries, even small changes can affect:
- mappers
- DTOs
- API responses
- business logic assumptions
- reporting behavior
- performance-sensitive flows

### 6.3 Verify both sides of the boundary
A stored procedure change is not verified until both sides are checked:
- database behavior
- application consumption behavior

It is not enough to say:
- “the proc returns rows”
or
- “the code compiles”

You must confirm that the consuming code still interprets the result correctly.

---

## 7. Result Shape Is a Contract

Even when no formal API contract changes, SQL result shape often behaves like an internal contract.

Changes to:
- column presence
- nullability
- ordering
- aggregation
- row cardinality
- deduplication behavior
- default values

can break code quietly.

Copilot-assisted work should explicitly consider:
- what shape the consumer expects
- whether that shape is changing
- whether the change is intentional
- what verification proves compatibility

This is especially important when the query feeds:
- API responses
- reports
- dashboards
- computed business logic
- downstream mapping code

---

## 8. Performance Awareness

Copilot can help draft SQL-related changes, but it should not be assumed to understand real workload performance in your environment.

Be careful when a change could affect:
- joins
- grouping
- filtering strategy
- large result sets
- repeated query execution
- stored procedure behavior under realistic volume
- application-side processing of DB results

You do not need deep benchmarking for every change, but you do need awareness.

Questions to ask:
- Did this change make the query broader?
- Did we move filtering later than before?
- Are we pulling more data into memory?
- Did we change cardinality or repeated access patterns?
- Did we replace a deliberate stored-procedure path with a less suitable one?

If performance matters to the task, treat it as a real verification dimension.

---

## 9. Verification Expectations

SQL-related work requires evidence.

Verification may include:
- unit tests where appropriate
- integration tests
- realistic data checks
- manual validation of query output
- API behavior checks
- mapper verification
- edge-case/null-result checks
- build success
- consumer compatibility validation

### Strong verification examples
- confirmed original bug condition using representative data
- validated result shape after query change
- checked null and empty-result behavior
- confirmed API consumer still receives expected output
- verified stored procedure parameter behavior against calling code

### Weak verification examples
- “query runs”
- “code compiles”
- “results look fine”
- “Copilot suggested this change”

The closer a change is to a data boundary, the stronger the evidence should be.

---

## 10. PR and Review Guidance

A strong SQL-related PR should explain:
- what data behavior changed
- why it changed
- whether result shape changed
- whether stored procedures were affected
- how compatibility was checked
- what performance or risk concerns were considered
- how the change was verified

Reviewers should look for:
- hidden semantics changes
- mapper impact
- result-shape drift
- ordering/filtering changes
- silent null-handling changes
- accidental broadening of scope

If the reviewer cannot quickly understand the data behavior impact, the PR is not ready.

---

## 11. Common Anti-Patterns

Avoid:
- trusting generated EF queries without reading semantics
- replacing stored procedures casually
- changing query behavior without checking consumers
- underestimating null and empty-result behavior
- mixing DB changes with unrelated refactoring
- ignoring ordering/cardinality changes
- accepting “works locally” as sufficient evidence for a SQL-sensitive change
- using AI to generate data-layer complexity that no one can explain clearly

---

## 12. What Good Looks Like

A strong SQL-related AI-assisted change is:
- narrow in scope
- explicit about data behavior
- compatible with consuming code
- respectful of stored procedure architecture
- aware of performance-sensitive areas
- verified with concrete evidence

If a change reaches the database but nobody can clearly explain the effect on result shape and consumers, it is not ready.