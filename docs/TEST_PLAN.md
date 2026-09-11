# Test Plan

## v1 success scenario
1. Open app → Dashboard loads with seed data (revenue, expense, leads, tasks visible).
2. Go to Leads → click "Add Lead" → enter name "ABC Corp", stage "new", value 50000 → save → verify it appears on board.
3. Drag/move lead to "Won" stage → verify stage updates.
4. Go to Sales → click "New Order" → select the lead, enter amount 50000, status completed → save → verify order listed.
5. Go to Finance → click "Add Income" → amount 50000, category "sales", date today → save → verify it appears in list.
6. Go to Dashboard → verify revenue increased by 50000.

## Empty state
1. Clear all leads → Leads page shows "No leads yet. Create your first lead."
2. Dashboard lead funnel shows zeros, not a blank crash.

## Error state
1. Disconnect network → submit a form → error toast "Could not save. Check your connection."
2. Reload → previously saved data still present (DB is source of truth).

## Loading state
1. Each page shows skeleton/spinner while data fetches.

## Compliance alert
1. Set business compliance_deadline to 3 days from today → Dashboard shows red alert.
2. Set to 15 days away → no alert.

## Task completion
1. Create task with due date tomorrow → verify urgency flag (yellow).
2. Mark done → verify it leaves the active list.
