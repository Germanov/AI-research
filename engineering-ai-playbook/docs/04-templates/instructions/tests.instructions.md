# Tests Instructions

Follow the existing test patterns in this repository.

Rules:
- Prefer focused tests that verify behavior, not implementation trivia.
- Add or update tests when the change affects behavior that should stay protected.
- For bug fixes, prefer regression-oriented coverage where appropriate.
- Reuse existing test structure, naming, and fixture patterns.

What to test:
- The changed behavior itself
- Relevant edge cases
- Contract-sensitive behavior where applicable
- Error, validation, and empty states where relevant
- Data or mapping behavior when persistence logic changes

What to avoid:
- Overly broad tests that are hard to maintain
- Tests that only mirror the implementation instead of the expected behavior
- New test patterns that conflict with the existing repository style
- Weak tests added only to appear complete

Verification:
- Prefer a few strong tests over many weak ones.
- If something cannot be tested automatically, call out the manual verification needed.
- Be explicit about what remains unverified.