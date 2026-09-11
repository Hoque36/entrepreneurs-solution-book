# Intelligence Layer

## Messy inputs
Entrepreneurs enter lead names, expense categories, task descriptions in free text — inconsistent spelling, mixed Bangla/English, no categorization.

## Auto-structure schema
When a transaction or lead is created, auto-classify it:
```json
{
  "object_type": "transaction",
  "raw_input": { "type": "expense", "amount": 2500, "note": "Facebook ad boost" },
  "structured": {
    "category": "marketing",
    "normalized_amount": 2500
  },
  "source": "rule-based-category-matcher",
  "confidence": 0.85,
  "review_status": "unreviewed"
  }
```

## Events to track
- lead_created, lead_stage_changed, sales_order_created
- transaction_logged (income/expense), task_completed
- marketing_campaign_added

## Scoring rules (v1 — rule-based, no AI)
1. **Lead priority score**: `estimated_value / 10000` capped at 10, +2 if stage=qualified, +3 if stage=won
2. **Task urgency**: days_to_due < 1 → high; 1–3 → medium; >3 → low (override user priority)
3. **Compliance risk**: if compliance_deadline < 7 days away → flag red
4. **Marketing ROI**: `conversions / budget * 1000` (conversions per 1000 BDT)

## What gets ranked
- Leads by priority score (dashboard top 5)
- Tasks by urgency + priority
- Marketing campaigns by ROI

## v1 vs later
**v1:** all rule-based, computed in server actions.
**Later:** AI lead scoring, auto-draft ad copy, expense anomaly detection, predictive revenue trends.
