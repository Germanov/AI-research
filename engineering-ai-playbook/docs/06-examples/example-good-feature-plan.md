# Example: Good Feature Plan

## Purpose

This example shows what a strong feature plan looks like for AI-assisted implementation.

---

## Feature

Add an export action to the orders table so users can export the current filtered results.

---

## Goal

Allow users to export the currently filtered orders list without changing the existing search, filtering, or selection behavior.

---

## In Scope

- Add export action to the orders table toolbar
- Use the existing UI action pattern for table-level actions
- Export the currently filtered dataset
- Preserve the existing table layout and selection behavior
- Add verification for empty-result and filtered-result scenarios

---

## Out of Scope

- redesign of the orders screen
- changes to table selection behavior
- changes to backend filtering logic
- introduction of a new export framework
- unrelated cleanup in the table component

---

## Existing Pattern to Reuse

- existing toolbar action pattern used in the customers table
- existing export service already used by reports screen
- current Angular theme toolbar and layout rules
- current API filtering contract

---

## Smallest Safe Slice

1. Add the export action button using the existing toolbar pattern
2. Reuse the current filter state already applied to the table
3. Connect to the existing export service
4. Verify filtered and empty states
5. Leave all existing table behaviors unchanged

---

## Risks

- accidental change to table layout or responsive behavior
- exporting unfiltered data instead of the currently filtered result
- introducing duplicate action patterns instead of reusing the shared one
- changing existing search or selection behavior indirectly

---

## Verification Plan

- verify export button renders correctly in the existing toolbar
- verify export includes currently filtered rows only
- verify behavior when no rows are available
- verify table selection still behaves as before
- verify layout remains correct on relevant screen widths

---

## Why This Is a Good Feature Plan

This plan is strong because it:
- keeps scope explicit
- identifies reuse points
- defines non-goals
- proposes a small vertical slice
- makes verification clear