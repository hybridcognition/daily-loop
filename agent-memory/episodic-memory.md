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