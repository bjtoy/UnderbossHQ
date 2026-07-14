# UnderbossHQ — Master Roadmap

**Single source of truth** for planning. Deploy/smoke checks: [LAUNCH_CHECKLIST.md](./LAUNCH_CHECKLIST.md). User docs: [USER_MANUAL.md](./USER_MANUAL.md).

---

## Direction

UnderbossHQ is a **live faction ops platform**: Discord OAuth dashboard + Express API + co-located Discord bot (Render API, Vercel dashboard).

| Phase | Goal | Status |
|-------|------|--------|
| **1. Core platform** | Auth, roles, guides, announcements, mod/admin tools, bot, deploy | **Done** |
| **2. Product polish** | Ship pending UI (Help, mobile nav), fix remaining bot/UX gaps, finish Stripe end-to-end | **Now** |
| **3. Growth / monetization** | Premium bot tier, faction billing, marketplace, merch | **Next** |
| **4. Scale** | Multi-guild operator views, deeper analytics, paid API | **Later** |

**Work the “Not complete” list in Phase 2 order before opening large Phase 3 features.**

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
- [x] Collapsible mobile nav (code on `cursor/mobile-friendly-nav` — **ship to dashboard `main` / Vercel still pending**)

### I — Optional features (built)

- [x] Invite tracking
- [x] Faction analytics (basic)
- [x] Event scheduling (basic)
- [x] Advanced moderation (bot + dashboard hooks)
- [x] Webhooks (as implemented)
- [x] AI tooling (backend exists; **UI removed** — credits/gating out of active product surface)

### J — Monetization (partial)

- [x] Premium membership gates + complimentary access grants
- [x] Stripe Checkout + Customer Portal (wired; confirm env + webhooks on Render)

### K — Production hardening

- [x] Helmet, rate limiting, secure production cookies/CORS
- [x] Prisma migrate on deploy, SPA redirects, render blueprint
- [x] Error logging / admin system logs
- [x] Env verification scripts

### L — Deployment

- [x] Backend + bot on Render (`underbosshq-api-hp8b.onrender.com`)
- [x] Dashboard on Vercel (`underbosshq-two.vercel.app`)
- [x] Production Postgres, SSL, launch checklist, health monitor script
- [x] Parent repo docs + user manual (`USER_MANUAL.md` / Word download)

---

## Not complete

### Phase 2 — Ship & stabilize (do these next)

| Priority | Item | Notes |
|----------|------|--------|
| P0 | Merge dashboard **mobile nav + Help** to `main` and deploy Vercel | Local Help page / manual assets may still be uncommitted on feature branch |
| P0 | Confirm **Stripe** live end-to-end | Env secrets, webhook URL, test subscribe + portal cancel |
| P1 | Finish **launch checklist** checkboxes | [LAUNCH_CHECKLIST.md](./LAUNCH_CHECKLIST.md) still has open verify items |
| P1 | Bot UX polish | Prefer User/Channel selectors where useful; clear `/announce quick\|post\|list` usage |
| P1 | Multi-guild operator view | Dashboard list of guilds the bot is in |
| P2 | Custom domains (optional) | Beyond default Render/Vercel hosts |
| P2 | Post-launch alerting | Render/email/Slack on failed health checks |

### Phase 3 — Monetization & growth

- [ ] Stripe / billing hardened as default path (not just “wired”)
- [ ] One-time purchases (digital packs, templates)
- [ ] Faction (B2B) subscriptions
- [x] **Premium vs basic bot command split** (gate advanced slash commands via guild premium)
- [ ] Creator marketplace / revenue share
- [ ] Affiliate integrations
- [ ] Merch store
- [ ] API access (paid developer tier)

### Phase 4 — Scale & depth

- [ ] Richer faction analytics / influence
- [ ] Deeper event & recruitment tooling
- [ ] Push notifications / more webhook consumers
- [ ] Revisit AI features only if product + billing support them

---

## Suggested sequence (clear direction)

1. **Ship dashboard `main`** — merge mobile nav + Help/manual; verify Vercel build (`VITE_API_URL`).
2. **Money path** — Stripe webhook + complimentary/admin premium flows smoke-tested in production.
3. **Ops clarity** — guilds-added-to-bot view; finish launch-checklist greenticks.
4. **Premium bot** — define basic vs premium command sets and enforce on the bot + dashboard.
5. **Only then** — marketplace, faction subscriptions, merch, paid API.

---

*Last consolidated: July 2026*
