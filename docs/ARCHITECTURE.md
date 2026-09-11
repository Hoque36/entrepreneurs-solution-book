# Architecture

## Stack
- **Next.js 14** (App Router) + **Supabase** (Postgres, RLS) + **Vercel** deploy
- Styling: Tailwind CSS. State: React hooks + Supabase client.

## Build now vs later
**Now:** business profile, lead pipeline, sales orders, transaction register, task manager, marketing campaigns, dashboard.
**Later:** inventory, employee/training records, AI-generated ads copy, product video project tracking, multi-user roles, auth/login.

## Key user action flow
1. User opens Dashboard → sees revenue/expense summary + open tasks.
2. Creates a Lead → enters name, stage, value.
3. Moves lead to "Won" → creates Sales Order (amount, date).
4. Logs payment as Transaction (type=income, amount, category).
5. Dashboard KPIs recompute from live data.

## Responsive nav shell
Persistent left sidebar on desktop: Dashboard, Business, Leads, Sales, Finance, Tasks, Marketing. Collapses to hamburger menu on mobile. Current section highlighted.

## Layer plan
1. **Data layer** (`lib/data/`) — all Supabase reads/writes; typed query functions per object.
2. **App logic** (`lib/actions/`) — server actions for create/update/delete per feature.
3. **AI module** (`lib/ai/`) — reserved for later: auto-tag leads, draft ads copy, score tasks.
4. **UI** (`app/` routes + `components/`) — thin components calling data layer only.

## Why core runs without AI
Every CRUD operation and dashboard calculation is pure Postgres + server actions. AI features (lead scoring, ad copy, insights) layer on top but the app is fully functional without them.

## Repo structure
```
app/
  dashboard/page.tsx
  business/page.tsx
  leads/page.tsx
  sales/page.tsx
  finance/page.tsx
  tasks/page.tsx
  marketing/page.tsx
components/
  layout/Sidebar.tsx
  leads/LeadBoard.tsx
  finance/TransactionList.tsx
  ui/*
lib/
  data/        # typed DB access
  actions/     # server actions
  ai/          # AI hooks (later)
  utils/
tests/
```

## Module map
| Module | Responsibility | Owns | Build order |
|--------|---------------|------|-------------|
| data | All DB reads/writes | every table | 1st |
| business | Business profile + compliance | businesses | 2nd |
| leads | Lead pipeline CRUD | leads | 3rd |
| sales | Sales order CRUD | sales_orders | 4th |
| finance | Income/expense register | transactions | 5th |
| tasks | Task CRUD | tasks | 6th |
| marketing | Campaign logging | marketing_campaigns | 7th |
| dashboard | Summary + KPIs | growth_kpis (derived) | 8th |
