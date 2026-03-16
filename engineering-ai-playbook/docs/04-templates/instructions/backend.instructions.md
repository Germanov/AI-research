# Backend Instructions

Follow the existing backend patterns in this repository.

Rules:
- Preserve request and response contracts unless the task explicitly requires a contract change.
- Keep status code, validation, serialization, and error behavior stable unless intentionally changed.
- Follow the existing .NET and Web API toolkit patterns used in this repository.
- Reuse existing dependency injection, logging, validation, and exception-handling conventions.
- Prefer the smallest safe backend change.

Data access:
- Follow the current Entity Framework usage patterns for normal data access.
- Treat stored procedures as intentional architecture where they already exist.
- Do not replace stored procedures with new EF logic unless the task explicitly requires redesign.
- Review result shape, null handling, ordering, and compatibility carefully when changing data-access code.
- Respect existing SQL versus Couchbase boundaries in the service.

Reviewability:
- Do not mix bug fixes, refactors, and architecture changes without clear justification.
- Keep backend changes small enough for a reviewer to understand quickly.
- Simplify AI-generated code if it is more complex than the existing pattern.

Verification:
- Verify contract-sensitive behavior explicitly.
- Add or update tests where appropriate.
- Check behavior at the boundary, not only internal implementation.
- Call out any unverified data or integration risk clearly.