# Example: Good Bug Report

## Purpose

This example shows what a strong bug report looks like when prepared for AI-assisted investigation and implementation.

---

## Title

Order details screen fails when the API returns an order with a missing customer display name

---

## Summary

The order details screen crashes for some historical orders when the customer display name is missing in the API response.

This affects users trying to open older orders migrated from a legacy source.

---

## Affected Area

- Frontend: Angular order details screen
- Backend: order details API response mapping may also be relevant

---

## Environment

- Observed in: QA environment
- Browser: Edge
- Build: 2026.03.15.2

---

## Reproduction Steps

1. Sign in with a user who can access historical orders.
2. Open the order search screen.
3. Search for order ID `ORD-104882`.
4. Open the order details page.
5. Observe the page behavior after the initial data load.

---

## Expected Behavior

The order details screen should load successfully.
If the customer display name is unavailable, the screen should still render and show a safe fallback value.

---

## Actual Behavior

The screen fails during rendering and shows a generic error state.
In browser console logs, the failure points to UI logic that expects the customer display name to always be present.

---

## Evidence

- Screenshot attached: order-details-error.png
- Console excerpt:
  - `Cannot read properties of null (reading 'trim')`
- API sample from browser network tab shows:
  - `customerDisplayName: null`

---

## Known Scope and Risk

- Likely affects older migrated orders only
- Could affect any UI flow that assumes the customer display name is always populated
- Backend response mapping may need review if null handling is inconsistent across consumers

---

## Suggested Regression Areas

- order summary card
- order search results
- export view for historical orders
- any other UI that displays customer display name from the same response shape

---

## Why This Is a Good Bug Report

This report is strong because it provides:
- a clear repro path
- expected and actual behavior
- affected areas
- evidence
- likely scope
- candidate regression areas

It gives developers and QA enough structure to investigate safely.