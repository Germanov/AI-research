# Backend Checklist

## Scope

Use this checklist for backend implementation, review, and verification work.

---

## Understanding and Scope

- [ ] The problem and expected behavior are clear.
- [ ] The affected endpoint, handler, service, or process is identified.
- [ ] The scope is controlled and does not include unrelated cleanup.
- [ ] Existing patterns were reviewed before implementation started.

---

## Contract Safety

- [ ] Request and response shapes were reviewed.
- [ ] Status codes and validation behavior were checked.
- [ ] Error handling and exception behavior remain consistent.
- [ ] Serialization behavior remains correct.
- [ ] Any contract change is intentional, documented, and verified.

---

## Implementation Quality

- [ ] Existing toolkit and service patterns were followed.
- [ ] The smallest safe change was made.
- [ ] AI-generated code was simplified where needed.
- [ ] No unnecessary abstraction was introduced.
- [ ] Logging, validation, and dependency usage remain consistent.

---

## Data and Persistence

- [ ] Entity Framework usage follows existing patterns.
- [ ] Query behavior was reviewed for correctness.
- [ ] Stored procedures were treated as intentional architecture.
- [ ] Stored procedure parameter behavior and result shape were validated if affected.
- [ ] SQL or Couchbase behavior remains consistent with service design.

---

## Verification

- [ ] Relevant tests were added or updated.
- [ ] Existing tests pass.
- [ ] The project builds successfully.
- [ ] The changed behavior was verified manually where needed.
- [ ] Related risk areas were checked where appropriate.

---

## Review Readiness

- [ ] The change is easy to review.
- [ ] The summary explains what changed and why.
- [ ] The verification story is specific.
- [ ] Any remaining uncertainty is documented.