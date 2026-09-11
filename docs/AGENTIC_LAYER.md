# Agentic Layer

## Risk levels

### Low — auto (runs without approval)
- Auto-categorize transactions (rule-based)
- Auto-score leads by priority
- Auto-flag urgent tasks and compliance deadlines
- Auto-compute monthly KPIs

### Medium — draft then approve
- Draft lead follow-up reminder (creates a task, requires user to confirm)
- Draft monthly business summary report
- Draft marketing campaign recommendation (which channel to invest in)

### High — always approval before execution
- Send reminder email/SMS to lead contact
- Publish marketing campaign status update

### Critical — human only
- Delete a lead, sales order, or transaction
- Edit or void a completed sales order
- Change compliance status

## Named tools (v1)
- `categorize_transaction(transaction_id)` → auto
- `score_lead(lead_id)` → auto
- `flag_urgent_tasks(business_id)` → auto
- `compute_monthly_kpis(business_id, month)` → auto
- `create_followup_task(lead_id)` → draft (medium)

## Audit-log fields
- action_name: text
- actor: text (user email or "system")
- target_table: text
- target_id: uuid
- payload: jsonb
- created_at: timestamptz

## v1 vs later
**v1:** low-risk auto tools only (categorize, score, flag, compute). Medium tools stubbed.
**Later:** full draft-and-approve workflow, SMS/email sending, AI ad copy drafting.
