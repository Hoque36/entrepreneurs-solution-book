# Tasks & Sprints

## Sprint 1 — Database + Core Engine (v1 functional)
**Goal:** App renders with demo data, core CRUD works end-to-end.
- [ ] Create Supabase schema + seed data (7 tables, 3–5 rows each)
- [ ] Build `lib/data/` data-access layer for all objects
- [ ] Build responsive sidebar shell (desktop + mobile hamburger)
- [ ] Dashboard page: revenue vs expense, lead funnel, open tasks, compliance alert
- [ ] Business profile page: view/edit registration status + compliance deadline
- [ ] Leads page: pipeline board with stage columns, add/edit/move
- [ ] Sales page: create order, link to lead, list with status
- [ ] Finance page: add income/expense, filter by category/type, monthly summary
- [ ] Tasks page: create, set priority, mark done
- [ ] Marketing page: log campaign with budget/reach/conversions
- [ ] All forms persist to DB; UI reflects changes immediately
- **DoD:** Entrepreneur creates a lead, converts to sales order, logs income, and sees dashboard update — all without login.

## Sprint 2 — Intelligence + UX polish
**Goal:** Auto-scoring, flagging, and dashboard refinements.
- [ ] Auto-categorize transactions by keyword matching
- [ ] Lead priority scoring on dashboard (top 5)
- [ ] Task urgency flag (red/yellow/green)
- [ ] Compliance deadline countdown + alert on dashboard
- [ ] Marketing ROI calculation per campaign
- [ ] Empty/loading/error states for every page
- **DoD:** Dashboard shows scored leads, flagged tasks, compliance alert, and ROI per campaign.

## Sprint 3 — Lock it down (auth + RLS)
**Goal:** Per-user data isolation, login/signup.
- [ ] Supabase Auth: signup, login, logout
- [ ] Replace permissive RLS with `auth.uid() = user_id` on all tables
- [ ] Seed data tied to demo user
- [ ] Audit logging for all actions
- **DoD:** Logged-in user sees only their data; anonymous access blocked; every write logged.

## Sprint 4 — Growth & reporting
**Goal:** Monthly KPIs, export, insights.
- [ ] Growth KPI auto-compute (monthly revenue, expense, conversion rate)
- [ ] Monthly report page with trend chart
- [ ] CSV export of transactions and leads
- [ ] Draftable monthly summary (medium-risk, approve before send)
- **DoD:** User views monthly KPI report with trends and exports CSV.

## Gantt
```
Sprint 1: [DB + Core CRUD + Dashboard + all 7 pages]
Sprint 2: [Auto-scoring + UX states]
Sprint 3: [Auth + RLS + Audit]
Sprint 4: [KPIs + Export + Reporting]
```
v1 functional milestone = end of Sprint 1.
