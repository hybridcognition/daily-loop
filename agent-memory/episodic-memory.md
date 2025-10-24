# Episodic Memory

Time-stamped information, append only as a hard rule.

---

## Usage Instructions

**Purpose:** Your time-stamped event log. This is the source of truth for "what happened when."

**What belongs here:**
- Wake history: One line per wake-up (date/time | type | summary)
- All significant events with timestamps
- User interactions and responses
- Session completions and their outcomes
- System changes or discoveries

**Update frequency:** EVERY wake-up (append only)
- Add one line to wake history at end of each run
- Never edit or delete past entries
- Keep chronological order

**HARD RULE:** Append only. Never modify past entries.

**What does NOT belong here:**
- Current status (→ working-memory.md)
- Extracted patterns or principles (→ semantic-memory.md)
- Analysis or interpretation (→ semantic-memory.md)

**Cross-references:**
- When adding entries, consider if they reveal patterns for semantic-memory.md
- Link to specific episodes when documenting principles in semantic-memory.md
- Reference line numbers or dates when cross-referencing

---

## Wake History

Record of when the agent woke up and why (single line per wake-up).

Format: `date/time | type (cron, github trigger, manual) | summary of actions`

---

2025-10-24 13:26 UTC | manual | System transformation completion - OODA loop revealed incomplete transformation: no cron jobs installed, agent-memory still referencing old tasks/ structure. Installed standard cron schedule (morning 7am, evening 9pm Zurich, GitHub polling every 5min). Updated working-memory.md to reference new project-memory/ structure. Identified old decluttering data in archive/. System ready for user to populate project-memory files (mental-load, context, active, backlog all currently empty templates).

2025-10-24 13:47 UTC | manual | OODA loop execution. Processed 2 GitHub issues (#1, #2) requesting Discord test messages. Successfully sent both test messages via Discord webhook. Closed both issues with confirmation comments. Verified cron schedule operational (7:30am, 9pm Zurich + 5min polling). Discord and GitHub integration both confirmed working. System fully operational.

2025-10-24 14:00 UTC | manual | OODA loop execution. Processed GitHub issue #3 requesting test message with Terence McKenna quote. Successfully sent Discord message with "Nature loves courage..." quote. Closed issue #3. Fixed cron schedule comment (7:00am → 7:30am to match actual cron time). System operational.

2025-10-24 14:10 UTC | manual | OODA loop execution. Processed GitHub issue #4 requesting imaginary Terence McKenna quote about GitHub repositories. Successfully sent Discord message with creative McKenna-style quote about GitHub as "living memory palace" and "distributed version control system." Closed issue #4 with confirmation comment. System operational.

2025-10-24 16:10 UTC | manual | OODA loop execution. Processed GitHub issue #5 requesting two tasks with timed reminders. Extracted tasks: "Organize Halloween" (Saturday 10am Zurich) and "Write to Eugen" (today 10pm Zurich). Updated project-memory/active.md with both tasks. Created two one-time cron jobs: 0 22 24 10 * (today 10pm) and 0 10 26 10 * (Saturday 10am). Sent Discord confirmation. Closed issue #5. First real user tasks successfully loaded into system.