# UnderbossHQ — User Manual

Welcome to **UnderbossHQ**, the Discord control panel for your faction server. Use this guide to log in, navigate the dashboard, and complete everyday tasks.

**Dashboard:** [https://underbosshq-two.vercel.app](https://underbosshq-two.vercel.app)

---

## 1. What UnderbossHQ does

UnderbossHQ connects your Discord server to a web dashboard so staff can:

- View member profile stats and server activity
- Publish **guides**, **announcements**, and **events**
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

### 2.2 Choose a server

1. After login you land on **Select Server**.
2. Pick the Discord server you want to manage.
3. You must have **Manage Server** (or equivalent staff access) on that server for most tools.

Use **Change Server** in the sidebar anytime to switch.

### 2.3 Premium access

Some servers require an active **premium** subscription to use the dashboard.

| Situation | What to do |
|-----------|------------|
| You see **Premium required** | Ask a server owner/admin to subscribe, or ask the platform operator for complimentary access |
| You manage the server | Use **Subscribe with Stripe** on the paywall (if enabled) |
| You are a platform operator | Use **Premium & Billing** to grant server premium or complimentary users |

Complimentary users can use the dashboard without paying. Paying unlocks the **server** for everyone on it.

---

## 3. Who can do what

Access depends on your Discord permissions and UnderbossHQ roles.

| Role | Typical access |
|------|----------------|
| **Member** | Home, guides, announcements, events (read); translator |
| **Moderator** | Everything members have, plus moderation tools, analytics, case history, user lookup |
| **Admin** | Everything moderators have, plus admin dashboard, logs, webhooks, invites, users, settings |
| **Platform owner** | Premium & Billing (grant/revoke subscriptions and free users) |

If you expect staff tools but only see Member links, confirm your Discord roles sync correctly (**Admin → Sync Roles**).

---

## 4. Navigation basics

### Desktop

- Left **sidebar** lists pages you can open.
- Top bar shows **UnderbossHQ**, the current page name, your username, and the selected server.

### Mobile

- Tap the **menu** button (☰) to open navigation.
- Tap outside the drawer or choose a link to close it.
- Tables scroll sideways when they are wider than the screen.

### Always available

- **Change Server** — pick a different Discord server  
- **Log out** — end your session  
- **Translator** — floating button (🌐) for quick text translation (when premium/access allows)

---

## 5. Member features

### 5.1 Home

**Home** shows:

- Your profile for the selected server (server name, rank, warnings)
- Quick stats (members, guides, new members)
- Upcoming events
- Recent announcements

### 5.2 Guides

Browse faction guides published for your server.

- Open a guide to read it
- Staff with editor permission can **Create Guide**, edit, publish, and post to Discord

**Creating / editing a guide (staff):**

1. Go to **Guides → Create Guide** (or Edit on an existing guide).
2. Enter a title and content.
3. Use the toolbar for banners, colored text, callouts, and sections.
4. Preview on the right as you type.
5. **Save**, then optionally choose a Discord channel and **Post to Discord** / **Publish**.

### 5.3 Announcements

View server announcements. Staff can create, edit, delete, and post them to a Discord channel.

### 5.4 Events

View upcoming and past events. Staff can create events with title, description, location, and start/end times.

### 5.5 Translator

Use the floating **Translator** widget:

1. Tap 🌐.
2. Choose languages (or leave source as Auto-detect).
3. Type or paste text — translation updates after a short pause.
4. Copy or clear as needed.

---

## 6. Moderator tools

Visible when you have Mod / Moderator access.

### 6.1 Moderation Tools

Overview of live moderation stats (active cases, warnings, actions).

### 6.2 Active Cases / Case History / Case Detail

- **Active Cases** — members currently under review  
- **Case History** — past case records  
- Open a case for details and actions (warn notes, promote, demote, kick, depending on permissions)

### 6.3 User Lookup

Look up a Discord user by ID and run moderation actions (warn, promote, demote, kick) with a reason.

Always include a clear reason — it is logged for audit.

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

Use **Sync Roles** after changing Discord role mappings so dashboard permissions update.

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
- Welcome / log / guides / rules / announcements channels  
- Auto-role  

Save after changes so the bot and dashboard use the new channels.

---

## 8. Premium & Billing (platform operators)

Only **platform owners** see this section.

### Server premium

- Grant days of premium for the **currently selected server** (manual), or use Stripe when configured  
- Revoke server premium if needed  
- Paying unlocks the dashboard for everyone on that server

### Complimentary users

- Add a Discord **user ID** to grant free dashboard access to a person (any server)  
- Optional label/note for your records  
- Remove access when finished  
- Env-listed complimentary IDs must be removed from server environment variables

### Stripe (when configured)

- Server owners/admins can **Subscribe with Stripe** from the paywall  
- Operators can open the Stripe customer portal from Premium & Billing when a Stripe subscription exists

---

## 9. Discord bot (quick reference)

The bot runs with the backend when a bot token is configured. Common slash commands include:

| Area | Examples |
|------|----------|
| Utility | `/ping`, `/serverinfo`, `/help` |
| Moderation | `/warn`, `/kick`, `/mute`, `/promote`, `/demote` |
| Roles | `/role assign`, `/role remove`, `/role list` |
| Content | `/guide create`, `/guide post`, `/guide list`, announce helpers |

Exact commands depend on what is registered for your bot. Prefer the dashboard for long guides and announcements; use slash commands for quick in-Discord actions.

---

## 10. Tips & troubleshooting

| Problem | Try this |
|---------|----------|
| Stuck on login | Hard-refresh; confirm Discord OAuth redirect matches the API URL |
| Wrong server tools | Use **Change Server** and re-select |
| Missing Mod/Admin menu | Check Discord permissions; ask an admin to **Sync Roles** |
| Premium required screen | Subscribe (owner/admin) or request complimentary access |
| Guide won’t post | Save first; pick a Discord channel; confirm bot can post there |
| Mobile menu hard to use | Use the ☰ button; close by tapping outside the drawer |
| Translator not loading | Confirm you have dashboard access; try again in a few seconds |

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

For deployment and developer setup, see `QUICKSTART.md`, `DEPLOYMENT_GUIDE.md`, and `LAUNCH_CHECKLIST.md` in this repository.

---

*Last updated for the UnderbossHQ dashboard with premium billing, complimentary access, guides/announcements/events, moderation, and mobile navigation.*
