# Entrepreneurs Solution Book — PRD

## Problem
New entrepreneurs in Bangladesh juggle spreadsheets, manual ledgers, and scattered software to track registration, compliance, sales, finance, tasks, and marketing. They lose 5–10 hours/week and miss compliance deadlines.

## Target user
New entrepreneurs, startup founders, freelancers starting businesses, SME owners, tax practitioners, and business consultants in Bangladesh.

## Core objects
- **Business** — profile, registration status, compliance deadlines
- **Lead** — prospect pipeline (name, stage, source, value, contact)
- **SalesOrder** — closed sale (lead link, amount, date, status)
- **Transaction** — income or expense (type, amount, category, date, note)
- **Task** — daily ops task (title, due date, priority, status)
- **MarketingCampaign** — digital marketing activity (channel, budget, reach, conversions)
- **GrowthKPI** — monthly metric (revenue, expense, lead count, conversion rate)

## MVP (v1) checklist
- [ ] Business profile + registration/compliance tracker (status, deadlines)
- [ ] Lead pipeline board (add/edit/move stages)
- [ ] Sales order creation linked to leads
- [ ] Income & expense register with category filtering
- [ ] Task manager (create, prioritize, complete)
- [ ] Marketing campaign log with basic metrics
- [ ] Dashboard: revenue vs expense, lead funnel, open tasks, upcoming compliance
- [ ] All core CRUD works end-to-end against the database
- [ ] Demo data seeded; app visible without login

## Non-goals (v1)
- No mobile app (web-first)
- No AI forecasting
- No ERP-level inventory
- No payment gateway integration
- No multi-country compliance
- No custom enterprise features
- No multi-user roles/auth (v1 is single-user, demo-first)

## Success criteria
An entrepreneur opens the dashboard, sees their revenue vs expense for the month, creates a new lead, converts it to a sales order, logs the payment as income, and sees the dashboard numbers update in real time — all without a spreadsheet.
