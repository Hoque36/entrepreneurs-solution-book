create table if not exists businesses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  name text not null,
  legal_type text default 'sole_proprietor',
  registration_status text default 'not_started',
  registration_number text,
  tax_id text,
  compliance_deadline date,
  industry text,
  created_at timestamptz not null default now()
);

alter table businesses enable row level security;
drop policy if exists "businesses_v1_read" on businesses;
create policy "businesses_v1_read" on businesses for select using (true);
drop policy if exists "businesses_v1_write" on businesses;
create policy "businesses_v1_write" on businesses for all using (true) with check (true);

create table if not exists leads (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  name text not null,
  stage text default 'new',
  source text,
  estimated_value numeric default 0,
  contact text,
  notes text,
  created_at timestamptz not null default now()
);

alter table leads enable row level security;
drop policy if exists "leads_v1_read" on leads;
create policy "leads_v1_read" on leads for select using (true);
drop policy if exists "leads_v1_write" on leads;
create policy "leads_v1_write" on leads for all using (true) with check (true);

create table if not exists sales_orders (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  lead_id uuid,
  amount numeric default 0,
  order_date date default current_date,
  status text default 'pending',
  notes text,
  created_at timestamptz not null default now()
);

alter table sales_orders enable row level security;
drop policy if exists "sales_orders_v1_read" on sales_orders;
create policy "sales_orders_v1_read" on sales_orders for select using (true);
drop policy if exists "sales_orders_v1_write" on sales_orders;
create policy "sales_orders_v1_write" on sales_orders for all using (true) with check (true);

create table if not exists transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  type text not null default 'expense',
  amount numeric default 0,
  category text,
  transaction_date date default current_date,
  notes text,
  created_at timestamptz not null default now()
);

alter table transactions enable row level security;
drop policy if exists "transactions_v1_read" on transactions;
create policy "transactions_v1_read" on transactions for select using (true);
drop policy if exists "transactions_v1_write" on transactions;
create policy "transactions_v1_write" on transactions for all using (true) with check (true);

create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  title text not null,
  description text,
  due_date date,
  priority text default 'medium',
  status text default 'todo',
  created_at timestamptz not null default now()
);

alter table tasks enable row level security;
drop policy if exists "tasks_v1_read" on tasks;
create policy "tasks_v1_read" on tasks for select using (true);
drop policy if exists "tasks_v1_write" on tasks;
create policy "tasks_v1_write" on tasks for all using (true) with check (true);

create table if not exists marketing_campaigns (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  channel text default 'facebook',
  name text not null,
  budget numeric default 0,
  reach integer default 0,
  conversions integer default 0,
  start_date date,
  end_date date,
  created_at timestamptz not null default now()
);

alter table marketing_campaigns enable row level security;
drop policy if exists "marketing_campaigns_v1_read" on marketing_campaigns;
create policy "marketing_campaigns_v1_read" on marketing_campaigns for select using (true);
drop policy if exists "marketing_campaigns_v1_write" on marketing_campaigns;
create policy "marketing_campaigns_v1_write" on marketing_campaigns for all using (true) with check (true);

create table if not exists growth_kpis (
  id uuid primary key default gen_random_uuid(),
  user_id uuid,
  business_id uuid,
  month text,
  revenue numeric default 0,
  expense numeric default 0,
  lead_count integer default 0,
  conversion_rate numeric default 0,
  created_at timestamptz not null default now()
);

alter table growth_kpis enable row level security;
drop policy if exists "growth_kpis_v1_read" on growth_kpis;
create policy "growth_kpis_v1_read" on growth_kpis for select using (true);
drop policy if exists "growth_kpis_v1_write" on growth_kpis;
create policy "growth_kpis_v1_write" on growth_kpis for all using (true) with check (true);

insert into businesses (name, legal_type, registration_status, registration_number, tax_id, compliance_deadline, industry)
select 'Dhaka Digital Solutions', 'sole_proprietor', 'registered', 'RJSC-123847', 'TIN-5582934', '2025-12-31', 'IT Services'
where not exists (select 1 from businesses limit 1);

insert into businesses (name, legal_type, registration_status, registration_number, tax_id, compliance_deadline, industry)
select 'GreenLeaf Imports', 'limited', 'in_progress', 'RJSC-998234', 'TIN-7712398', '2025-06-30', 'Retail'
where not exists (select 1 from businesses where name = 'GreenLeaf Imports');

insert into leads (business_id, name, stage, source, estimated_value, contact, notes)
select id, 'Rahman Textiles', 'qualified', 'referral', 80000, '01711-223344', 'Looking for POS software'
from businesses where name = 'Dhaka Digital Solutions';

insert into leads (business_id, name, stage, source, estimated_value, contact, notes)
select id, 'Khan Electronics', 'new', 'facebook', 45000, '01822-556677', 'Saw Facebook ad'
from businesses where name = 'Dhaka Digital Solutions';

insert into leads (business_id, name, stage, source, estimated_value, contact, notes)
select id, 'City Mart', 'won', 'referral', 120000, '01933-889900', 'Repeat customer'
from businesses where name = 'Dhaka Digital Solutions';

insert into sales_orders (business_id, lead_id, amount, order_date, status, notes)
select b.id, l.id, 120000, '2025-01-15', 'completed', 'Annual maintenance contract'
from businesses b join leads l on l.business_id = b.id and l.name = 'City Mart'
where b.name = 'Dhaka Digital Solutions';

insert into sales_orders (business_id, amount, order_date, status, notes)
select id, 35000, '2025-02-01', 'pending', 'Website redesign deposit'
from businesses where name = 'Dhaka Digital Solutions';

insert into transactions (business_id, type, amount, category, transaction_date, notes)
select id, 'income', 120000, 'sales', '2025-01-15', 'Annual maintenance contract payment'
from businesses where name = 'Dhaka Digital Solutions';

insert into transactions (business_id, type, amount, category, transaction_date, notes)
select id, 'expense', 15000, 'marketing', '2025-02-01', 'Facebook ad campaign spend'
from businesses where name = 'Dhaka Digital Solutions';

insert into transactions (business_id, type, amount, category, transaction_date, notes)
select id, 'expense', 25000, 'office', '2025-01-05', 'Office rent January'
from businesses where name = 'Dhaka Digital Solutions';

insert into transactions (business_id, type, amount, category, transaction_date, notes)
select id, 'income', 35000, 'sales', '2025-02-01', 'Website redesign deposit'
from businesses where name = 'Dhaka Digital Solutions';

insert into tasks (business_id, title, description, due_date, priority, status)
select id, 'File VAT return', 'Submit monthly VAT return to NBR', '2025-03-15', 'high', 'todo'
from businesses where name = 'Dhaka Digital Solutions';

insert into tasks (business_id, title, description, due_date, priority, status)
select id, 'Follow up Khan Electronics', 'Call back about POS software quote', '2025-03-05', 'medium', 'todo'
from businesses where name = 'Dhaka Digital Solutions';

insert into tasks (business_id, title, description, due_date, priority, status)
select id, 'Prepare invoice for City Mart', 'Send Q1 invoice', '2025-02-28', 'high', 'done'
from businesses where name = 'Dhaka Digital Solutions';

insert into marketing_campaigns (business_id, channel, name, budget, reach, conversions, start_date, end_date)
select id, 'facebook', 'Winter POS Promo', 10000, 15000, 12, '2025-01-10', '2025-02-10'
from businesses where name = 'Dhaka Digital Solutions';

insert into marketing_campaigns (business_id, channel, name, budget, reach, conversions, start_date, end_date)
select id, 'google', 'Search Ads - IT Services', 8000, 8500, 8, '2025-02-01', '2025-02-28'
from businesses where name = 'Dhaka Digital Solutions';

insert into growth_kpis (business_id, month, revenue, expense, lead_count, conversion_rate)
select id, '2025-01', 120000, 40000, 3, 33.3
from businesses where name = 'Dhaka Digital Solutions';

insert into growth_kpis (business_id, month, revenue, expense, lead_count, conversion_rate)
select id, '2025-02', 35000, 23000, 2, 50.0
from businesses where name = 'Dhaka Digital Solutions';