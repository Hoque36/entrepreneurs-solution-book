# Security

## Secret handling
- Supabase keys: `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` in env only — never committed.
- Service role key (if used for migrations) stays server-side only, never in frontend.
- `.env.local` for local dev; Vercel env vars for production.

## Permission model
- **v1 (demo):** all tables have permissive RLS — any visitor can read/write. This is intentional for demo-first.
- **Lock-down sprint:** replace with `auth.uid() = user_id` policies on every table. Only the business owner sees their data.
- No cross-business data access after lock-down.

## Approved-tools rule
- Agent/system may only call named, whitelisted tools (see Agentic Layer). No raw SQL execution, no `run_any`/`send_any`.
- All data writes go through `lib/data/` functions with typed inputs.

## Audit principle
Every meaningful action (create, update, delete, auto-score, auto-categorize) is logged to `audit_logs` with actor, target, payload, and timestamp. The log is append-only — no deletes.
