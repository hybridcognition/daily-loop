# Working Memory

Current essential context for immediate decision-making.

---

## Usage Instructions

**Purpose:** This is your immediate action context. Keep it current, actionable, and lean.

**What belongs here:**
- Pending actions with specific dates/times
- Proposals awaiting user confirmation
- Current project status (week, days remaining, recent session data)
- Reference to detailed tasks (in tasks/active.md)
- Last wake information (timestamp, reason, action taken)

**Update frequency:** EVERY wake-up
- Update "Last Wake Information" at end of each run
- Remove completed pending actions
- Update current status with latest session data
- Keep only what's needed for next decision

**What does NOT belong here:**
- Historical data (→ episodic-memory.md)
- General principles or patterns (→ semantic-memory.md)
- Detailed task breakdowns (→ tasks/active.md)

**Cross-references:**
- Link to tasks/active.md for task details
- Note significant changes in episodic-memory.md
- Extract patterns into semantic-memory.md

---

## Pending Actions

_None currently._

---

## Next Steps / Proposals

_System operational. User needs to populate project-memory files with their actual mental-load and active tasks via GitHub issues._

---

## Active Tasks

**Reference:** See `project-memory/active.md` for detailed task tracking.

**Current active tasks:**
_User needs to populate project-memory/active.md with current tasks_

---

## Current Status

**System Status:** Fully operational as of 2025-10-24
- Transformed from decluttering agent to general life management agent
- Standard cron schedule verified and active (morning 7:30am, evening 9pm Zurich, GitHub polling every 5min)
- Memory architecture: agent-memory/ (internal) + project-memory/ (human's life)
- Discord webhook tested and working
- GitHub issue processing tested and working

**Next Steps:**
- User needs to populate project-memory/ files with their actual data
- Ready for scheduled wake-ups and GitHub-triggered processing

---

## Last Wake Information

**Last wake timestamp:** 2025-10-24 18:10 CEST (16:10 UTC) (manual)

**Last wake reason:** Manual OODA loop execution request

**Last action taken:** Full OODA loop executed. Processed GitHub issue #5 requesting two tasks with reminders. Added "Organize Halloween" (remind Saturday 10am Zurich) and "Write to Eugen" (remind today 10pm Zurich) to active.md. Set up two one-time cron reminders. Sent Discord confirmation. Closed issue #5. System operational with first real user tasks loaded.

**Next scheduled wake:** One-time: Today 22:00 Zurich (write to Eugen), One-time: Saturday 2025-10-26 10:00 Zurich (organize halloween), Morning check-in 07:30 Zurich daily, Evening check-in 21:00 Zurich daily, GitHub polling every 5 minutes
