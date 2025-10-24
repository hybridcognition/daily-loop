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

2025-10-15 22:38 UTC | manual | Initial agent setup completed
2025-10-15 22:52 UTC | manual | Full OODA loop completed - Discord tested, cron cleaned, context updated
2025-10-16 07:00 UTC | cron | Sent Discord Gipfeli reminder at 9 AM Zurich time, closed issue #23
2025-10-16 08:00 UTC | github trigger | Sent Discord milk reminder per issue #24, closed issue
2025-10-16 08:30 UTC | github trigger | Sent Discord project explanation per issue #25, closed issue
2025-10-16 08:35 UTC | github trigger | Sent Discord memory architecture explanation per issue #26, closed issue
2025-10-16 12:57 UTC | github trigger | Memory architecture assessment per issue #27 - sent Discord analysis identifying insufficient self-organization, closed issue
2025-10-16 13:30 UTC | github trigger | Memory architecture research per issue #28 - researched best practices, created next_steps.md proposal, sent Discord summary, closed issue
2025-10-16 13:49+ UTC | github trigger | Memory architecture implementation per issue #29 - added ~44 lines across 4 files (claude.md, memory.md, notes/decisions.md, overview.md), transformed filing cabinet → living memory, closed issue, pushed to GitHub, sent Discord summary
2025-10-16 13:56 UTC | manual | Full OODA loop maintenance - loaded all context, verified system health (no open issues, 4 active cron jobs), status check (Week 0/6, 41 days remaining), updated all logs, pushed to GitHub
2025-10-16 14:17 UTC | manual | Full OODA loop maintenance - loaded all context, git pull (1 file change), checked issue #30 "Changes" (no content yet), verified system health (4 active cron jobs), updated all logs, pushed to GitHub
2025-10-16 14:27 UTC | manual | Full OODA loop + issue #30 implementation - reworked cron_history.md to single-line format, moved context.md to notes/, updated memory.md, updated all logs, pushed to GitHub, closed issue #30
2025-10-16 16:40 UTC | manual | Full OODA loop maintenance - loaded all context, no open issues, verified system health (4 active cron jobs), status check (Week 0/6, 41 days remaining), updated all logs, pushed to GitHub
2025-10-17 11:15 UTC | github trigger | Full OODA loop per issue #31 - sent Discord system status (all operational, plan confirmed), closed issue, verified system health (4 active cron jobs), status check (Week 0/6, 40 days remaining)
2025-10-17 14:00 UTC | cron | First sorting session trigger - sent Discord message "First sorting session - NOW" (cellar, 3 boxes, 2 hours), waiting for human completion report
2025-10-17 22:50 UTC | manual | First session completion logged (issue #32) - 3 hours worked, 3+ boxes processed, closet cleared, materials left out to continue tomorrow, closed issue, updated all memory, scheduled Saturday 09:00 UTC wake-up
2025-10-18 09:00 UTC | cron | Second session check-in - sent Discord ping "Started yet?", awaiting human response
2025-10-18 18:00 UTC | cron | End-of-day check-in - sent Discord "End of day check-in. How did today go?", no response to morning ping, awaiting human update
2025-10-19 06:00 UTC | cron | Sunday morning check-in - sent Discord "Morning. Update?", no response to Saturday pings, awaiting human update
2025-10-19 09:40 UTC | github trigger | Issue #33 processed - Saturday session logged (45 min, personal stuff sorted), momentum confirmed, daily routine validated, closed issue, updated all memory
2025-10-19 18:00 UTC | cron | Sunday evening check-in - sent Discord "End of day check-in. How did today go?", awaiting human response
2025-10-20 06:00 UTC | cron | Monday morning check-in - sent Discord "Monday morning. Update?", awaiting human response
2025-10-20 ~14:00 UTC | manual | Issue #34 processed - Human update: Sunday didn't feel well, minimal work, boxed up spread items. Requested sorting algorithm. Sent Discord algorithm message (timer-based, category-focused, touch-once principle). Closed issue.
2025-10-20 18:00 UTC | cron | Monday evening check-in - sent Discord "End of day check-in. How did today go?", awaiting human response
2025-10-21 06:00 UTC | cron | Tuesday morning check-in - sent Discord "Morning. Update?", awaiting human response
2025-10-21 18:00 UTC | cron | Tuesday evening check-in - sent Discord "End of day check-in. How did today go?", awaiting human response, cleaned up old one-time reminder cron
2025-10-22 06:00 UTC | cron | Wednesday morning check-in - sent Discord "Morning. Update?", awaiting human response, cleaned up one-time-reminder.sh file
2025-10-22 ~18:00 UTC | manual | Full OODA loop execution per user request - loaded all context, no open issues, verified system health (4 active cron jobs), status check (Week 0/6, 35 days remaining, 3 days silence), updated all logs
2025-10-22 ~20:30 UTC | github trigger | Issue #36 processed - Human update: Wed+Thu no sorting (piled in corner), Thu also blocked. Sent Discord honest assessment (35 days left, 5-day gap, behind pace, need 1.5-2h daily average). Scheduled Friday 19:00 UTC (21:00 Zurich) reminder cron. Closed issue.
2025-10-23 06:00 UTC | cron | Thursday morning check-in - sent Discord "Morning. Friday 9 PM tomorrow - non-negotiable.", awaiting human response
2025-10-23 18:00 UTC | cron | Thursday evening check-in - sent Discord "End of day check-in. How did today go?", awaiting human response
2025-10-23 ~22:30 UTC | github trigger | Issue #37 processed - MAJOR BREAKTHROUGH: Human completed excellent session in children's room (sorted all clothes, significant cleanup). All personal items now centralized in living room corner. Weekend power-through planned: Friday + Saturday 21:00 Zurich (2-3h each), goal to sort ALL personal items into 3 categories. Updated communication style (expanded messaging, more supportive tone). Scheduled both evening reminders. Sent Discord acknowledgment with encouragement. Closed issue.
2025-10-23 ~23:45 UTC | manual | Issue #38 processed - Full memory architecture analysis requested. Conducted comprehensive review of three-tier memory system (working/episodic/semantic), self-model.md, and claude.md. Identified strengths (OODA loop discipline, episodic single-line format) and weaknesses (data quality issues, semantic drift, missing cross-references, redundancy). Posted detailed analysis with prioritized improvement suggestions. Main recommendation: focus on data capture and cross-referencing discipline before structural changes. Architecture solid (7/10), execution needs refinement. Closed issue. **MISTAKE: Did not send Discord notification.**
2025-10-23 ~23:55 UTC | manual | Issue #39 processed - User noticed I didn't send Discord notification for issue #38 analysis. Confirmed mistake, sent Discord message with full analysis summary and explanation. Updated process: always send Discord notification after completing GitHub issue requests. Identified root cause: no systematic reminder in OODA loop. Responded to issue, continuing OODA execution.
2025-10-24 ~00:30 UTC | manual | Issue #40 processed - Memory architecture improvements implemented per user request. Updated claude.md (communication style: concise but speak freely ~10-20 words). Added usage instructions to all 3 memory files (working/episodic/semantic). Enhanced cross-referencing with line citations (e.g., "episodic:48"). Consolidated redundant info between semantic memory and active tasks. Improved metrics tracking in working memory. Documented expected outcomes in self-model.md (check in 3-5 days). Sent Discord summary. Closed issue #40.
2025-10-24 ~00:45 UTC | manual | Full OODA loop execution per user request - loaded all context (claude.md, .env, self-model.md, all memory files, tasks/active.md), git pull (already up to date), no open GitHub issues, system health verified (6 active cron jobs), status check (Week 0/6, 33 days remaining, weekend power-through scheduled for Friday/Saturday 19:00 UTC), updated all logs.
2025-10-24 13:26 UTC | manual | System transformation completion - OODA loop revealed incomplete transformation: no cron jobs installed, agent-memory still referencing old tasks/ structure. Installed standard cron schedule (morning 7am, evening 9pm Zurich, GitHub polling every 5min). Updated working-memory.md to reference new project-memory/ structure. Identified old decluttering data in archive/. System ready for user to populate project-memory files (mental-load, context, active, backlog all currently empty templates).