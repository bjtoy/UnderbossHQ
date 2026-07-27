# UnderbossHQ — Master Roadmap

**Single source of truth** for planning. Deploy/smoke checks: [LAUNCH_CHECKLIST.md](./LAUNCH_CHECKLIST.md). User docs: [USER_MANUAL.md](./USER_MANUAL.md).

**Last audit:** 28 July 2026 — full review of `L:\UnderbossHQ` (parent, `backend/`, `dashboard/`).

---

## Direction

UnderbossHQ is a **live faction ops platform**: Discord OAuth dashboard + Express API + co-located Discord bot (Render API, Vercel dashboard).

| Phase | Goal | Status |
|-------|------|--------|
| **1. Core platform** | Auth, roles, guides, announcements, mod/admin tools, bot, deploy | **Done** |
| **2. Product polish & billing** | Public site, Revolut paywall, subscription UX, merchant verification | **Now** |
| **3. Growth / monetization** | Multi-tier checkout, individual plans, marketplace, merch | **Next** |
| **4. Scale** | Multi-guild operator views, deeper analytics, paid API | **Later** |

**Work the “Not complete” list in Phase 2 order before opening large Phase 3 features.**

---

## Audit summary (28 Jul 2026)

### Build & runtime

| Check | Result |
|-------|--------|
| Dashboard `npm run build` | **Pass** |
| Backend `npm run verify-env` | **Pass** (Stripe optional warning expected) |
| Backend syntax (`index.js`, `server.js`) | **Pass** |
| Dashboard ESLint | **33 issues** (mostly strict React 19 rules — non-blocking; build unaffected) |

### Working as intended

- Discord OAuth, guild select, role-based dashboards
- Guides, announcements, moderation, admin tools, bot slash commands
- **Public pages** (Home, Pricing, Contact, Help, Demo, Terms, Privacy) — no login required
- **Revolut billing code path** (checkout redirect, webhook handler, premium grant)
- **Subscription prompts** for logged-in free users (sidebar, `/premium`, banners)
- **Customer currency display** on pricing and checkout buttons (approximate FX; charged in AUD)
- Premium bot command gating, complimentary access, operator admin tools
- Static HTML preview in `index.html` for crawlers (Revolut / merchant verification)

### Issues found

| Severity | Issue | Action |
|----------|--------|--------|
| **Critical** | `getCheckoutPricing()` not on default Revolut export — broke `billingCheckout` on `/api/auth/me` | **Fixed locally** — commit + deploy backend |
| **Critical** | Revolut **production env vars** may be unset on Render → `billingConfigured: false`, no checkout | Set on Render API service (see below) |
| **Critical** | `stripe_backup_code.txt` in parent folder (untracked) | **Do not commit** — added to `.gitignore`; delete or move to secure storage |
| **High** | Revolut merchant verification still pending | Custom domain optional; ensure live site + product description visible to crawlers |
| **High** | **Single checkout price** (`REVOLUT_PREMIUM_AMOUNT`) vs **multiple tiers** on pricing page | Align env amount with default server plan OR implement per-plan checkout |
| **High** | **Individual plans** — display only; no automated checkout (email support) | Phase 3 or manual process for now |
| **Medium** | Guide **banner PNGs missing** (`public/banners/*.png`) — build warns; Discord/guide previews fall back | Add banner assets per `public/banners/README.md` |
| **Medium** | `@revolut/checkout` in parent `package.json` unused — app uses hosted checkout URL redirect | Remove orphan dep or implement embedded widget later |
| **Medium** | Parent repo tracks `backend/` + `dashboard/` as nested repos; pointer commits may lag | Update parent after subrepo pushes |
| **Medium** | LAUNCH_CHECKLIST still Stripe-centric | Update checklist with Revolut env + webhook steps |
| **Low** | ESLint warnings (setState-in-effect, unused imports) | Clean up incrementally |
| **Low** | FX rates in `customerCurrency.js` are static approximations | Optional live rates API later |
| **Low** | Free Render DB/service spin-down | Upgrade plan or accept cold-start delays |

---

## Complete

### A — Database

- [x] Prisma schema, relationships, production Postgres
- [x] Core tables (members, roles, guides, announcements, settings, moderation/bot logs)
- [x] Premium / complimentary access models

### B — Backend foundations

- [x] Express app, middleware, Passport Discord OAuth
- [x] Sessions (Postgres store) + credentialed cookies
- [x] DB connection, health endpoint

### C — Core API routes

- [x] Members, users, guides (+ versions), announcements, settings, moderation
- [x] Guild-scoped APIs / bot admin + mod APIs

### D — Discord role sync + permissions

- [x] Role sync engine (`guildMemberAdd/Update/Remove`, startup sync)
- [x] File-based permissions (`config/roles.js`)
- [x] Auth middleware + protected routes

### E — Frontend roles & auth

- [x] Role context, permission helpers, protected routes
- [x] Hide/show sidebar by role; not-authorized fallback
- [x] OAuth callback, `/api/auth/me`, guild select, role-based landing

### F — Frontend ↔ API

- [x] Shared `api.js` with credentials
- [x] Member / mod / admin screens wired to live data
- [x] Loading / error patterns on dashboards

### G — Bot integration

- [x] Bot worker starts with backend when `DISCORD_TOKEN` set
- [x] Slash commands (warn, mute, kick, promote/demote, announce, guide, role, help, ping, …)
- [x] Staff auth hardening (owner / Manage Messages / mapped roles / `ADMIN_DISCORD_IDS`)
- [x] Announce/guide subcommand + global command sync fix
- [x] Dashboard bot status, guild info, sync-roles, reload-config, live logs

### H — Dashboard product UI

- [x] Guide editor (styled content), announcement manager
- [x] Moderation / system logs viewer
- [x] Settings + user management
- [x] Brand fonts, login styling, grouped sidebar + page headers
- [x] Floating translator widget
- [x] Collapsible mobile nav
- [x] **Public site shell** — unified branding, gold links, richer layout
- [x] **Help page** + public help overview

### I — Optional features (built)

- [x] Invite tracking
- [x] Faction analytics (basic)
- [x] Event scheduling (basic)
- [x] Advanced moderation (bot + dashboard hooks)
- [x] Webhooks (as implemented)
- [x] AI tooling (backend exists; UI removed from active surface)

### J — Monetization (partial)

- [x] Premium membership gates + complimentary access grants
- [x] Stripe Checkout + Customer Portal (legacy; `BILLING_PROVIDER=stripe`)
- [x] **Revolut Merchant checkout** (default paywall)
- [x] **In-app subscription prompts** for non-premium users
- [x] **Local currency price display** (checkout settles in AUD)
- [x] Premium vs basic bot command split

### K — Production hardening

- [x] Helmet, rate limiting, secure production cookies/CORS
- [x] Prisma migrate on deploy, SPA redirects, render blueprint
- [x] Error logging / admin system logs
- [x] Env verification scripts

### L — Deployment

- [x] Backend + bot on Render (`underbosshq-api-hp8b.onrender.com`)
- [x] Dashboard on Vercel (`underbosshq-two.vercel.app`)
- [x] Production Postgres, SSL, launch checklist, health monitor script
- [x] Parent repo docs + user manual

---

## Not complete

### Phase 2 — Ship & stabilize (do these next)

| Priority | Item | Notes |
|----------|------|--------|
| **P0** | **Deploy backend billing fix** | `getCheckoutPricing` export fix — commit + push `UnderbossHQ-backend` |
| **P0** | **Revolut live on Render** | `BILLING_PROVIDER=revolut`, `REVOLUT_MERCHANT_SECRET_KEY`, `REVOLUT_PREMIUM_AMOUNT` (minor units, e.g. `1400` = A$14), `REVOLUT_PREMIUM_CURRENCY=AUD`, `REVOLUT_WEBHOOK_SIGNING_SECRET`, `DASHBOARD_REQUIRES_PREMIUM=true` |
| **P0** | **Revolut webhook** | `POST https://underbosshq-api-hp8b.onrender.com/api/revolut/webhook` · event `ORDER_COMPLETED` |
| **P0** | **Rotate exposed API keys** | Any key pasted in chat must be revoked in Revolut Business |
| **P0** | **End-to-end payment smoke test** | Log in as non-premium → `/premium` → Revolut checkout → `/premium/success` → premium active |
| **P1** | **Revolut merchant verification** | Resubmit with live URL; static product description in `index.html` + Contact page |
| **P1** | **Align checkout amount with pricing** | One `REVOLUT_PREMIUM_AMOUNT` today — set to default server plan (e.g. Server App A$14/mo) or build multi-plan checkout |
| **P1** | **Add guide banner PNGs** | `dashboard/public/banners/` — see README there |
| **P1** | Finish **launch checklist** | [LAUNCH_CHECKLIST.md](./LAUNCH_CHECKLIST.md) — add Revolut section |
| **P2** | Custom domain (optional) | `underbosshq.com` — helps merchant trust; update `FRONTEND_URL`, OAuth redirect, Vercel |
| **P2** | Multi-guild operator view | Dashboard list of guilds the bot is in |
| **P2** | ESLint cleanup | 33 non-blocking issues in dashboard |
| **P2** | Post-launch alerting | Render/email/Slack on failed health checks |
| **P2** | Remove unused `@revolut/checkout` from parent `package.json` | Or implement embedded checkout later |

### Phase 3 — Monetization & growth

- [ ] Per-plan Revolut checkout (Individual App/Bot/Bundle, Server App/Bot/Bundle)
- [ ] Individual plan self-serve checkout (currently email support)
- [ ] Annual billing option in Revolut
- [ ] One-time purchases (digital packs, templates)
- [ ] Faction (B2B) subscriptions with invoicing
- [ ] Creator marketplace / revenue share
- [ ] Affiliate integrations
- [ ] Merch store
- [ ] API access (paid developer tier)
- [ ] Live FX rates for price display (optional)

### Phase 4 — Scale & depth

- [ ] Richer faction analytics / influence
- [ ] Deeper event & recruitment tooling
- [ ] Push notifications / more webhook consumers
- [ ] Revisit AI features only if product + billing support them

---

## Revolut production env (Render API service)

| Variable | Example |
|----------|---------|
| `BILLING_PROVIDER` | `revolut` |
| `DASHBOARD_REQUIRES_PREMIUM` | `true` |
| `REVOLUT_MERCHANT_SECRET_KEY` | Live key from Revolut Business → Merchant → API |
| `REVOLUT_PREMIUM_AMOUNT` | `1400` (= A$14.00 in cents) |
| `REVOLUT_PREMIUM_CURRENCY` | `AUD` |
| `REVOLUT_PREMIUM_PERIOD_DAYS` | `30` |
| `REVOLUT_WEBHOOK_SIGNING_SECRET` | From webhook setup |
| `REVOLUT_SANDBOX` | omit or `false` for live |

**Do not** paste secrets in chat or commit `.env` files.

---

## Suggested sequence

1. **Deploy backend fix** + confirm `/api/auth/me` returns `billingCheckout` when Revolut env is set.
2. **Configure Revolut on Render** + webhook → smoke-test checkout in production.
3. **Revolut merchant resubmission** — live public site, pricing, contact, product description.
4. **Banner assets** + launch checklist greenticks.
5. **Multi-plan checkout** — then individual self-serve, marketplace, merch.

---

*Last consolidated: 28 July 2026*
