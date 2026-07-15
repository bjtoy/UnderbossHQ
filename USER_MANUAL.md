# UnderbossHQ — User Manual

Welcome to **UnderbossHQ**, the Discord control panel for your faction server. Use this guide to log in, manage content, moderate members, and use the bot.

**Dashboard:** [https://underbosshq-two.vercel.app](https://underbosshq-two.vercel.app)

**Download:** [UnderbossHQ-User-Manual.docx](./UnderbossHQ-User-Manual.docx)  
**In the app:** open **Help** in the sidebar (`/help`) for the same guide online.

To rebuild the Word file after editing this markdown: `cd dashboard && npm run build:manual`

---

## 1. What UnderbossHQ does

UnderbossHQ connects your Discord server to a web dashboard so staff can:

- View member profile stats and server activity
- Write rich **guides** (banners, fonts, callouts), **announcements**, and **events**
- Post content from the dashboard straight into Discord channels
- Moderate members (warn, promote, demote, kick, case files)
- Track invites and server growth
- Configure bot channels and sync roles
- Subscribe for premium access (or receive complimentary access)

The Discord bot and the dashboard share the same data for your selected server.

---

## 2. Getting started

### 2.1 Sign in

1. Open the dashboard URL.
2. Click **Login with Discord**.
3. Authorize UnderbossHQ when Discord asks for permission.
4. You will return to the dashboard automatically.

If login fails, ask your server admin to confirm the bot is installed and OAuth is configured correctly.

On the login page you can also **Download User Manual** (Word) without signing in.

### 2.2 Choose a server

1. After login you land on **Select Server**.
2. Pick the Discord server you want to manage.
3. You need **Manage Server** (or equivalent staff access) on that server for most tools.

From Select Server you can open **Help** or download the Word manual before choosing a guild.

Use **Change Server** in the sidebar anytime to switch.

### 2.3 Premium access

Some servers require an active **premium** subscription to use most of the dashboard.

| Situation | What to do |
|-----------|------------|
| You see **Premium required** | Ask a server owner/admin to subscribe, or ask the platform operator for complimentary access |
| You manage the server | Use **Subscribe with Stripe** on the paywall (if enabled) |
| You are a platform operator | Use **Premium & Billing** to grant server premium or complimentary users |

Complimentary users can use the dashboard without paying. Paying unlocks the **server** for everyone on it.

**Help** stays available even when the paywall is up, so you can still read this guide.

---

## 3. Who can do what

Access depends on your Discord permissions and UnderbossHQ roles. After role changes, an admin should run **Admin → Sync Roles**.

| Role | Typical access |
|------|----------------|
| **Member** | Home, guides / announcements / events (read), Help, translator |
| **Enforcer** | Create and edit guides; **publish / post guides to Discord** |
| **Moderator** (Mod) | Everything Enforcers have for guides, plus announcements, events, moderation tools, analytics, case history, user lookup |
| **Admin** | Full server tools: admin dashboard, logs, webhooks, invites, users, settings |
| **Platform owner** | Premium & Billing (grant/revoke subscriptions and complimentary users) |

### Guide permissions (detail)

| Action | Who |
|--------|-----|
| Read / view guides | Everyone with dashboard access |
| Create / edit guides | Admin, Mod, Moderator, Enforcer |
| Delete guides | Admin, Mod, Moderator (not Enforcer) |
| Publish / post to Discord | Roles with **PUBLISH_GUIDE** — Admin, Mod, Moderator, and Enforcer |

If Discord posting fails with a permission error, you will see a toast message (you are not hard-redirected away). Ask an admin to sync roles or grant the right Discord role mapping.

---

## 4. Navigation basics

### Desktop

- Left **sidebar** lists pages you can open (sections appear based on your roles).
- Top bar shows **UnderbossHQ**, the current page name, your username, and the selected server.

### Mobile

- Tap the **menu** button (☰) to open navigation.
- Tap outside the drawer or choose a link to close it.
- Tables scroll sideways when they are wider than the screen.
- Prefer portrait mode for reading guides.

### Always available

- **Change Server** — pick a different Discord server  
- **Log out** — end your session  
- **Help** — this guide (`/help`); works before picking a server and behind the premium paywall  
- **Translator** — floating button (🌐) when you are not blocked by the paywall  

---

## 5. Member features

### 5.1 Home

**Home** shows:

- Your profile for the selected server (server name, rank, warnings)
- Quick stats (members, guides, new members)
- Upcoming events
- Recent announcements

### 5.2 Guides — reading

**Content → Guides**

- Browse faction guides for the selected server
- Open a guide to read the styled dashboard layout
- Use **Copy for Discord** when you need a plain-text version for paste

### 5.3 Guides — create, format, and post (staff)

Staff with guide editor roles use **Create Guide** or **Edit**.

**Basic flow**

1. Go to **Guides → Create Guide** (or Edit on an existing guide).
2. Enter a **title**.
3. Write content in the editor. New guides start with a sample Fancy / Caudex banner you can replace.
4. Use the **tabbed toolbar** (see below) to insert blocks.
5. Watch the **live preview** as you type.
6. **Save**.

**Posting to Discord** (needs **PUBLISH_GUIDE**)

**From the editor**

1. Choose a **Discord channel** (defaults often come from Admin → Settings — guides or rules channel).
2. Use **Save & post**, **Post to Discord**, or **Publish & post**.

**From the Guides list (quick post)**

1. Select **Discord channel for quick post** at the top of the list.
2. On a guide card, click **Post to Discord**.

Discord does not render the full dashboard styling. The bot posts a Discord-friendly version; for hand-copying, use **Copy for Discord**.

### 5.4 Guide editor — formatting toolkit

The create/edit screen uses four toolbar tabs:

#### Tab 1 — Banner

Title banners for the top of a guide.

| Option | What you can pick |
|--------|-------------------|
| **Style** | Standard, Fancy, Minimal, Gaming, Tactical, Plaque, Ribbon, Poster |
| **Font** | Fancy (e.g. Caudex, Playfair, Great Vibes), Sans / Title (e.g. Oswald, Bebas, Orbitron), Typewriter / TT (e.g. Special Elite, VT323, Space Mono) |
| **Color / texture** | Solids (Crimson, Gold, Noir, Velvet…) and textures (Parchment, Carbon fiber, Marble, Damask, Tactical grid, Herringbone, Brushed metal) |

#### Tab 2 — Structure

| Block | Variants |
|-------|----------|
| **Section** | Plain, Bar, Pill, Divider |
| **Heading** | Large, Medium, Small |

#### Tab 3 — Text

| Style | Use for |
|-------|---------|
| Body | Normal paragraphs |
| Lead | Larger intro text |
| Quote | Quoted lines |
| Note | Secondary notes |
| Centered | Centered lines |

Also insert **colored highlights** (red, gold, green, blue, muted, etc.).

#### Tab 4 — Callouts

Ready-made Tip, Warning, and Important boxes for key instructions.

**Tips**

- Preview regularly — some decorative fonts look best at banner size.
- Keep Discord posts short; put the long rich version on the dashboard.
- Rules-style titles may auto-suggest the **rules** channel when posting.

### 5.5 Announcements

View server announcements. Staff (Admin / Mod / Moderator) can create, edit, delete, and post them to a Discord channel (including quick-post from the list when available).

### 5.6 Events

View upcoming and past events. Staff (Admin / Mod / Moderator) can create events with title, description, location, and start/end times.

### 5.7 Translator

Use the floating **Translator** widget (hidden while the premium paywall is blocking you):

1. Tap 🌐.
2. Choose languages (or leave source as Auto-detect).
3. Type or paste text — translation updates after a short pause.
4. Copy or clear as needed.

---

## 6. Moderator tools

Visible when you have Mod / Moderator access (Admin also sees these).

### 6.1 Moderation Tools

Overview of live moderation stats (active cases, warnings, actions).

### 6.2 Active Cases / Case History / Case Detail

- **Active Cases** — members currently under review  
- **Case History** — past case records  
- Open a case for details and actions (warn notes, promote, demote, kick, depending on permissions)

### 6.3 User Lookup

Look up a Discord user by ID and run moderation actions (warn, promote, demote, kick) with a reason.

Always include a clear reason — it is logged for audit. Usernames are resolved when Discord profile data is available.

### 6.4 Analytics

Server growth and activity overview: content counts, moderation totals, joins, top inviters, recent joins.

---

## 7. Admin tools

Visible when you have Admin access.

### 7.1 Admin Dashboard

- Bot online/offline and latency  
- Guild member count  
- Premium status (for operators)  
- **Reload Bot Config** and **Sync Roles**

Use **Sync Roles** after changing Discord role mappings so dashboard permissions (including guide publish) update.

### 7.2 System Logs

Operational / system log view for troubleshooting.

### 7.3 Webhooks

Create outbound webhooks for server events (name, URL, enabled flag, event types). Test or disable as needed.

### 7.4 Invites

Invite tracking — see who invited whom and review join history.

### 7.5 Users

Manage synced dashboard user profiles (search, rename, add/delete profile records). Profiles are normally created by Discord sync; manual adds are rare.

### 7.6 Settings

Configure bot-related defaults for the selected server, including:

- Command prefix  
- Welcome / log / **guides** / **rules** / announcements channels  
- Auto-role  

Save after changes. Guide and announcement post pickers use these channel defaults when possible.

---

## 8. Premium & Billing (platform operators)

Only **platform owners** see this section in the sidebar.

### Server premium

- Grant days of premium for the **currently selected server** (manual), or use Stripe when configured  
- Revoke server premium if needed  
- Paying unlocks the dashboard for everyone on that server  
- Guild premium also unlocks **premium Discord bot** slash commands (see below)

### Complimentary users

- Add a Discord **user ID** to grant free **dashboard** access to a person (any server)  
- Optional label/note for your records  
- Remove access when finished  
- Env-listed complimentary IDs must be removed from server environment variables  

Complimentary dashboard users are separate from **server** premium that unlocks the full bot command set for the guild.

### Stripe (when configured)

- Server owners/admins can **Subscribe with Stripe** from the paywall  
- Operators can open the Stripe customer portal from Premium & Billing when a Stripe subscription exists  
- Checkout and billing flows still work when the rest of the dashboard is locked

---

## 9. Discord bot (quick reference)

The bot runs with the backend when a bot token is configured. Prefer the **dashboard** for long styled guides and announcements; use slash commands for quick in-Discord actions.

### Free commands (every guild)

| Area | Examples |
|------|----------|
| Utility | `/ping`, `/serverinfo`, `/help` |
| Moderation | `/warn`, `/mute`, `/kick` |

### Premium commands (guild must have premium)

| Area | Examples |
|------|----------|
| Content | `/announce`, `/guide`, `/guide-styled` |
| Staff | `/promote`, `/demote` |
| Roles / access | `/role`, `/channel-access` |

Exact command names depend on what is registered for your bot. Staff slash actions still require staff Discord permissions even when the guild has premium.

---

## 10. Tips & troubleshooting

| Problem | Try this |
|---------|----------|
| Stuck on login | Hard-refresh; confirm Discord OAuth redirect matches the API URL |
| Wrong server tools | Use **Change Server** and re-select |
| Missing Mod/Admin/Enforcer tools | Check Discord roles; ask an admin to **Sync Roles** |
| Premium required screen | Subscribe (owner/admin) or request complimentary access — **Help** stays available |
| Can’t see Post to Discord | Confirm you have **PUBLISH_GUIDE** (Admin / Mod / Moderator / Enforcer after sync) |
| Guide won’t post | Save first; pick a channel; confirm the bot can post there; read the toast error |
| Banner fonts look wrong | Try another font group; keep fancy fonts for titles, not long paragraphs |
| Mobile menu hard to use | Use the ☰ button; close by tapping outside the drawer |
| Translator not loading | Confirm you are past the paywall; try again in a few seconds |

### Mobile

- Prefer portrait mode for reading guides  
- Use the hamburger menu instead of scrolling a long nav list  
- For tables (invites, analytics), swipe horizontally  

### Safety

- Never share Discord tokens, Stripe keys, or session cookies  
- Only grant complimentary access to people you trust  
- Log moderation reasons clearly  

---

## 11. Legal & support

- [Terms of Service](/terms) (in the dashboard)  
- [Privacy Policy](/privacy) (in the dashboard)  
- **Help** — in-app guide at `/help`  
- **Download User Manual** — Word file from the login page, Help page, Select Server, or [UnderbossHQ-User-Manual.docx](./UnderbossHQ-User-Manual.docx)

For deployment and developer setup, see `QUICKSTART.md`, `DEPLOYMENT_GUIDE.md`, and `LAUNCH_CHECKLIST.md` in this repository.

---

*Last updated for guide formatting toolkit, Enforcer publish/quick-post, Help without guild / behind paywall, and free vs premium bot commands.*
