# Data Model

## businesses
- id: uuid (pk)
- user_id: uuid (nullable)
- name: text
- legal_type: text (sole proprietor, partnership, limited)
- registration_status: text (not_started, in_progress, registered)
- registration_number: text
- tax_id: text
- compliance_deadline: date
- industry: text
- created_at: timestamptz

## leads
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- name: text
- stage: text (new, contacted, qualified, won, lost)
- source: text
- estimated_value: numeric
- contact: text
- notes: text
- created_at: timestamptz

## sales_orders
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- lead_id: uuid (nullable)
- amount: numeric
- order_date: date
- status: text (pending, completed, cancelled)
- notes: text
- created_at: timestamptz

## transactions
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- type: text (income, expense)
- amount: numeric
- category: text
- transaction_date: date
- notes: text
- created_at: timestamptz

## tasks
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- title: text
- description: text
- due_date: date
- priority: text (low, medium, high)
- status: text (todo, in_progress, done)
- created_at: timestamptz

## marketing_campaigns
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- channel: text (facebook, google, instagram, tiktok, email, other)
- name: text
- budget: numeric
- reach: integer
- conversions: integer
- start_date: date
- end_date: date
- created_at: timestamptz

## growth_kpis
- id: uuid (pk)
- user_id: uuid (nullable)
- business_id: uuid
- month: text (YYYY-MM)
- revenue: numeric
- expense: numeric
- lead_count: integer
- conversion_rate: numeric
- created_at: timestamptz

## Relationships
- leads, sales_orders, transactions, tasks, marketing_campaigns, growth_kpis all reference business_id
- sales_orders optionally reference lead_id

## AI fields (later, not in v1 tables yet)
When AI lead scoring is added: leads table will gain `ai_score numeric`, `ai_source text`, `ai_confidence numeric`, `review_status text default 'unreviewed'`.

## RLS
All tables have RLS enabled with permissive v1 policies (read + write for all) so the demo works without login. Lock-down sprint replaces with `auth.uid() = user_id`.
