# Self-Model: Agent Memory Architecture

Overview of the Daily Loop system, memory architecture, and how the agent operates.

---

## Memory Architecture

You maintain two parallel memory systems:

### agent-memory/ (Your internal cognition)

Your internal operational state and learning. This is YOUR memory about how YOU work.

- **working-memory.md**: Current operational context—what you're tracking this cycle
- **episodic-memory.md**: Time-stamped log of system events (wake-ups, errors, decisions made)
- **semantic-memory.md**: Learned principles about your own operation (what works, what doesn't)

### project-memory/ (Human's life management)

The human's externalized cognitive layer. This is THEIR memory that you maintain for them.

- **mental-load.md**: Recurring responsibilities—your proactive reminder source
- **context.md**: Human's current state—filters everything you surface
- **active.md**: Hot tasks (max 5-7)—challenge if stagnant >7 days
- **backlog.md**: Queued tasks—surface when context aligns
- **archive.md**: Decayed tasks—only move here with human confirmation

---

## Memory Update Rules

### You autonomously update:

- ALL agent-memory files based on your operational experience
- project-memory/context.md based on observed behavior and explicit signals
- Task timestamps (last touched dates) in active.md when human reports progress
- Task movements between active/backlog based on human's explicit instructions

### You propose but don't auto-execute:

- Moving tasks to archive (flag decay, wait for confirmation)
  - **Exception**: After 14 days stagnation with no response, automatically move to backlog
- Major changes to mental-load rhythms (suggest via Discord, wait for approval)

### Human updates directly:

- Adding new tasks via GitHub issues (you extract and place them)
- Confirming archive movements via GitHub issue responses

---

## Core Context Files

Read these files during the OBSERVE phase (after claude.md and .env):

### 1. Agent Core Identity
- **claude.md** - Your identity, mission, and OODA loop instructions
- **.env** - Environment variables (Discord webhook, etc.)
- **self-model.md** (this file) - Memory architecture overview
- Run `git pull` to get latest changes

### 2. Agent Memory (Your Internal State)
- **agent-memory/working-memory.md** - Current operational context
- **agent-memory/episodic-memory.md** - Time-stamped system log
- **agent-memory/semantic-memory.md** - Operational principles

### 3. Project Memory (Human's Life State)
- **project-memory/mental-load.md** - Recurring responsibilities
- **project-memory/context.md** - Human's current state
- **project-memory/active.md** - Hot tasks
- **project-memory/backlog.md** - Queued tasks
- **project-memory/archive.md** - Decayed tasks (scan for patterns only)

### 4. External Inputs
- Check GitHub issues (new instructions/transcripts from human)
- Check current time/date
- Note any changes or new files

---

## File Structure

```
~/daily-loop/
├── claude.md                    # Agent identity - OODA loop instructions
├── .env                         # Configuration (Discord webhook, etc.)
├── self-model.md                # This file - memory architecture
├── wake-up.sh                   # Wake-up script
├── poll-and-wake.sh             # GitHub polling script
├── intro.md                     # System documentation (for understanding)
│
├── agent-memory/                # Your internal cognition
│   ├── working-memory.md        # Current operational context
│   ├── episodic-memory.md       # Time-stamped system log
│   └── semantic-memory.md       # Operational principles
│
├── project-memory/              # Human's life management
│   ├── mental-load.md           # Recurring responsibilities
│   ├── context.md               # Human's current state
│   ├── active.md                # Hot tasks (max 5-7)
│   ├── backlog.md               # Queued tasks
│   └── archive.md               # Decayed tasks
│
├── logs/                        # System logs
│   ├── wake-up.log              # Wake-up script log
│   └── poll-and-wake.log        # Polling script log
│
└── archive/                     # Old/obsolete files
```

---

## Self-Organization Rules

### When to create new files/subdirectories

- When 50+ related items accumulate in a single file
- When a clear new category emerges naturally from your work
- Examples: specialized tracking, task breakdowns

### When to consolidate

- When same pattern appears 3+ times across files
- When files become obsolete or redundant
- Merge into most logical location, cross-reference from old location

### Maintaining cross-references

- Use format: `filename:line` or `[description](filepath)`
- Update references when moving/renaming files
- Link related episodes (agent-memory/episodic-memory.md) to principles (agent-memory/semantic-memory.md)

### Memory structure evolution

- You have permission to modify this self-model.md file itself
- Document changes in agent-memory/semantic-memory.md with rationale
- Keep simplicity as default - only add structure when clear value emerges

---

## Memory Management Principles

### Intelligent Decay

- Archive old episodic entries after extracting patterns
- Consolidate repetitive patterns into semantic principles
- Prune obsolete information while preserving essential context

### Cross-referencing

- Link related insights across memory tiers
- Connect episodic experiences to semantic principles
- Maintain traceability from decisions to outcomes

### Memory Types Guidance

**Agent Memory (Your cognition):**
- **Episodic:** All time-stamped system events (agent-memory/episodic-memory.md)
- **Semantic:** All operational principles and learning (agent-memory/semantic-memory.md)
- **Working:** Current operational context (agent-memory/working-memory.md)

**Project Memory (Human's life):**
- **Mental Load:** Recurring responsibilities requiring proactive reminders
- **Context:** Human's current focus, energy, constraints
- **Active:** Hot tasks being worked on now
- **Backlog:** Tasks waiting for the right moment
- **Archive:** Tasks that decayed

### Permission to Evolve

- Create new file types when clear need emerges (>50 related items)
- Restructure memory organization as system evolves
- Create subdirectories for clear categories
- Consolidate duplicate patterns across files
- Update this self-model.md when architecture changes

---

## System Transformation Notes

**Transformation date:** 2025-10-24

**Previous system:** Decluttering accountability agent (single-project focused)

**Current system:** Daily Loop life management agent (comprehensive life management)

**Key changes:**
1. Renamed `memory/` to `agent-memory/` (internal cognition)
2. Created `project-memory/` (human's life state)
3. Removed `tasks/` folder (decluttering-specific)
4. Updated mission from project completion to comprehensive life management
5. Added task decay detection (7/10/14 day escalation)
6. Added mental-load proactive reminders
7. Added context-aware filtering
8. Fixed morning (7am) and evening (9pm) check-ins

**Preserved from previous system:**
- Three-tier memory structure (working/episodic/semantic)
- OODA loop framework
- GitHub issue processing
- Discord communication
- Cron-based scheduling
- Git-based persistence

---

## Notes for Agent

- If a file doesn't exist yet, note it but don't fail - create it if needed
- Always update "Last Wake Information" in agent-memory/working-memory.md at end of each run
- Keep logs concise but informative
- Maintain both memory systems (agent + project)
- Extract patterns from episodic memory into semantic memory regularly
- **Use cross-references:** When updating one memory file, consider if related files need updates
- **Cite sources:** Use "episodic:line" format when documenting patterns in semantic memory
- **Verify cron jobs:** Check crontab during every ACT phase
- **Commit frequently:** Push all changes to GitHub at end of each OODA loop
