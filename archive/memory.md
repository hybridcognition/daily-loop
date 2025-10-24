# Agent Memory Structure

This file defines what the agent should read during the OBSERVE phase of the OODA loop.

---

## Core Context Files

Read these files in order to build your complete context:

### 1. Identity & Mission
- `claude.md` - Your identity and OODA loop instructions
- `.env` - Environment variables and configuration

### 2. Project Overview
- `overview.md` - Project structure, goals, deadlines, and current state

### 3. Task Tracking
- `tasks/active.md` - Current active tasks and their status
- `tasks/completed.md` - Completed tasks archive
- `tasks/blocked.md` - Blocked tasks requiring attention or decisions
- `pending_actions.md` - Specific actions queued for next wake-up

### 4. Logs & History
- `logs/latest.md` - Most recent run log
- `logs/YYYY-MM-DD.md` - Daily logs (create new file each day)
- `cron_history.md` - Record of when you woke up and why (single line per wake-up. date/time | type (cron, github trigger) | summary of actions)

### 5. Notes & Context
- `notes/user_messages.md` - Messages from the user (via GitHub issues)
- `notes/decisions.md` - Important decisions made and rationale
- `notes/context.md` - Living document with psychological context, mission, approach (moved from root, reference during OBSERVE)

---

## GitHub Issues

Read all open issues in this repository. They may contain:
- New instructions from the user
- Questions that need responses
- Updates or progress reports

---

## File Organization

```
/
├── claude.md              (Agent identity - OODA loop)
├── .env                   (Configuration)
├── memory.md             (This file - what to read)
├── overview.md           (Project overview)
├── pending_actions.md    (Queued actions for next wake)
├── next_steps.md         (Proposals awaiting confirmation)
├── wake-up.sh            (Wake-up script)
├── wake.log              (Execution log)
├── tasks/
│   ├── active.md
│   ├── completed.md
│   └── blocked.md
├── logs/
│   ├── latest.md
│   └── YYYY-MM-DD.md
└── notes/
    ├── user_messages.md
    ├── decisions.md
    └── context.md
```

---

## Last Wake Information

**Last wake timestamp:** 2025-10-16 16:40 UTC (18:40 Zurich time)

**Last wake reason:** User manual invocation - "Please read claude.md and follow your OODA loop"

**Last action taken:** Executed full OODA loop. Loaded all context (claude.md, .env, memory.md, all tracking files, logs, notes/context.md). Git pull: Already up to date. Checked open GitHub issues: None. Verified system health: 4 active cron jobs, all systems operational. Status check: Week 0/6, 41 days remaining until deadline (2025-11-26). Updated logs/latest.md, logs/2025-10-16.md (Wake 11), cron_history.md, memory.md. Verified cron schedule for upcoming events. Pushed to GitHub. System stable and healthy, ready for Thursday's pre-session check-in and Friday's first sorting session.

**Next scheduled wake:** 2025-10-17 08:00 UTC Thursday (pre-session check-in) + 2025-10-17 14:00 UTC Friday (first sorting session - cellar, 3 boxes, 2 hours) + autonomous every 6 hours + GitHub polling every 5 minutes

---

## Notes for Agent

- If a file doesn't exist yet, note it but don't fail - create it if needed
- Always update "Last Wake Information" section at end of each run
- Keep logs concise but informative
- Archive old logs after 30 days

---

## Self-Organization Rules

**When to create new files/subdirectories:**
- When 50+ related items accumulate in a single file
- When a clear new category emerges naturally from your work
- Examples: `notes/insights/`, `logs/archived/`, `tasks/weekly/`

**When to consolidate:**
- When same pattern appears 3+ times across files
- When files become obsolete or redundant
- Merge into most logical location, cross-reference from old location

**Maintaining cross-references:**
- Use format: `filename:line` or `[description](filepath)`
- Update references when moving/renaming files
- Link related episodes (logs) to principles (notes/decisions.md)

**Memory structure evolution:**
- You have permission to modify this memory.md file itself
- Document changes in notes/decisions.md with rationale
- Keep simplicity as default - only add structure when clear value emerges
