# System Introduction: Autonomous Accountability Agent

A comprehensive guide to understanding this self-directed AI agent system for persistent, long-term task completion.

---

## Table of Contents

1. [What Is This?](#what-is-this)
2. [The Problem It Solves](#the-problem-it-solves)
3. [Core Concept: Autonomous Accountability Agent](#core-concept-autonomous-accountability-agent)
4. [System Architecture Overview](#system-architecture-overview)
5. [The OODA Loop](#the-ooda-loop)
6. [Memory Architecture](#memory-architecture)
7. [File Structure & Purposes](#file-structure--purposes)
8. [Automation & Scheduling](#automation--scheduling)
9. [Communication Channels](#communication-channels)
10. [The Specific Mission](#the-specific-mission)
11. [How It All Works Together](#how-it-all-works-together)
12. [Key Design Principles](#key-design-principles)
13. [Example Workflow](#example-workflow)

---

## What Is This?

This is an **autonomous AI agent system** that runs headless (without human intervention) on a Linux server and provides persistent accountability for completing long-term projects. The agent:

- Runs the Claude AI model via Claude Code CLI
- Operates continuously over weeks/months
- Self-schedules its own wake-ups
- Maintains persistent memory across sessions
- Communicates asynchronously with humans via Discord
- Takes full responsibility for project completion while the human makes final decisions

**Key distinction:** This is not a chatbot or assistant you talk to. It's an autonomous agent that operates independently, checks in regularly, and drives progress toward a concrete deadline.

---

## The Problem It Solves

### The Human Challenge

Many people struggle with projects that:
- Take weeks or months to complete
- Require sustained daily effort
- Involve difficult decisions (e.g., decluttering)
- Are easy to procrastinate on
- Have been "on the list" for years

**Example from this implementation:** A 6-week household decluttering project where the goal is to sort through every cabinet, cellar, and attic, removing 2/3 of items. The human has attempted this for years but stalls due to:
- Taking everything out at once (overwhelm)
- Difficulty letting go of items
- Lack of external accountability
- No consistent structure or momentum

### The Solution

An AI agent that:
- **Provides external accountability:** Checks in daily, tracks progress, maintains momentum
- **Forces structure:** Breaks down overwhelming tasks into manageable steps
- **Maintains persistence:** Never forgets, never gives up, operates continuously
- **Adapts to reality:** Adjusts strategy based on actual progress, not ideal plans
- **Removes decision burden:** Tells the human exactly what to do next and when
- **Owns the deadline:** Agent is responsible for project completion, not just suggestions

---

## Core Concept: Autonomous Accountability Agent

### What Makes It "Autonomous"?

1. **Self-scheduling:** The agent decides when it needs to wake up based on project needs (no fixed schedule)
2. **Self-directed cognition:** Uses OODA loop (Observe-Orient-Decide-Act) to make decisions
3. **Persistent memory:** Maintains context across sessions using structured memory files
4. **Proactive communication:** Initiates contact with humans, not just responds
5. **Full agency:** Takes responsibility for outcomes, not just task completion

### The Accountability Model

**Traditional accountability:**
- Human: "I should do X"
- Human: *doesn't do X*
- Human: *feels guilty, tries again tomorrow*

**Agent accountability:**
- Agent: "You will do X at time Y"
- Agent: *sends reminder at time Y*
- Agent: *follows up if no response*
- Agent: *adjusts strategy based on actual behavior*
- Agent: *owns the final deadline*

**Key principle:** The agent doesn't wait for the human to feel ready. It creates structure, applies gentle pressure, and maintains momentum.

---

## System Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                     AUTONOMOUS AGENT                         │
│                  (Claude Code + Linux Server)                │
└─────────────────────────────────────────────────────────────┘
                              │
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
┌─────────────┐      ┌─────────────┐      ┌─────────────┐
│   MEMORY    │      │   OODA      │      │ AUTOMATION  │
│   SYSTEM    │      │   LOOP      │      │  & COMMS    │
│             │      │             │      │             │
│ • Working   │      │ • Observe   │      │ • Cron Jobs │
│ • Episodic  │◄────►│ • Orient    │◄────►│ • GitHub    │
│ • Semantic  │      │ • Decide    │      │ • Discord   │
│             │      │ • Act       │      │ • Scripts   │
└─────────────┘      └─────────────┘      └─────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                              ▼
                    ┌─────────────────┐
                    │   HUMAN USER    │
                    │ (Async, Discord)│
                    └─────────────────┘
```

**Three Core Components:**

1. **Memory System:** Persistent knowledge store across sessions (working, episodic, semantic)
2. **OODA Loop:** Decision-making framework executed each wake-up
3. **Automation & Communication:** Scheduling, triggers, and human interface

---

## The OODA Loop

**OODA** stands for **Observe → Orient → Decide → Act** (military decision-making framework by John Boyd). The agent executes this loop every time it wakes up.

### 1. OBSERVE - Pull everything into context

**Goal:** Load all relevant data into the agent's context window. No interpretation yet, just raw information gathering.

**Actions:**
- Read `claude.md` (agent identity and instructions)
- Read `.env` file (environment variables, API keys)
- Run `git pull` (get latest changes from GitHub)
- Read `self-model.md` (memory architecture guide)
- Read all memory files:
  - `memory/working-memory.md` (current essential context)
  - `memory/episodic-memory.md` (time-stamped event log)
  - `memory/semantic-memory.md` (extracted knowledge)
- Read task files:
  - `tasks/active.md` (current active tasks)
  - `tasks/done.md` (completed tasks archive)
- Check GitHub issues (new instructions from human)
- Note any changes, new files, or updates

**Why this matters:** AI models are stateless. Each wake-up is a fresh session with no memory of previous runs. The OBSERVE phase reconstructs the agent's "mind" by loading all relevant context from persistent storage.

### 2. ORIENT - Structure your understanding

**Goal:** Transform raw data into structured understanding. Separate signal from noise.

**The agent answers three questions:**
1. **What do you understand you SHOULD do?**
   - Based on all context loaded
   - What are the priorities?
   - What's due soon?

2. **What do you understand HAS BEEN done?**
   - Progress to date
   - Completed tasks
   - Current state of the project

3. **What do you understand you SHOULD NOT do?**
   - Boundaries and constraints
   - Things to avoid
   - Learned patterns (e.g., "Don't take everything out at once")

**Why this matters:** Prevents bias and assumptions. The agent explicitly articulates its understanding before acting, reducing misinterpretation.

### 3. DECIDE - Write your to-do list

**Goal:** Create a clear, specific action plan for this session.

**Actions:**
- Based on ORIENT understanding, create a concrete to-do list
- Be specific (not "check on user" but "send Discord message asking for Friday session confirmation")
- Be realistic (what can actually be accomplished this session)
- One clear plan, no ambiguity

**Why this matters:** Transforms understanding into executable actions. The to-do list is the bridge between cognition and action.

### 4. ACT - Execute everything

**Goal:** Complete every item on the to-do list, fully and without shortcuts.

**Actions during execution:**
- Execute each to-do item
- If something cannot be completed (permissions, missing data, etc.), log why
- Update memory files as work progresses
- After completing tasks, always:

**1. Push to GitHub:**
```bash
git add .
git commit -m "Clear message describing what was done"
git push
```

**2. Set next wake-up:**
- Decide when to wake next based on what needs to happen
- If something specific is pending: schedule for when it makes sense
- If nothing urgent: schedule within 12 hours maximum
- Update cron job accordingly
- **RULE:** Always set a cron job. Never leave yourself unscheduled.

**3. Exit cleanly**

**Why this matters:**
- Git push = persistent memory (if server crashes, all work is saved)
- Self-scheduling = continuous operation (agent decides when it's needed)
- Clean exit = system remains in operational state

---

## Memory Architecture

The system uses a **three-tier memory structure** inspired by human cognitive science:

```
┌──────────────────────────────────────────────────────────┐
│                    MEMORY SYSTEM                          │
├──────────────────────────────────────────────────────────┤
│                                                           │
│  ┌─────────────────────────────────────────────────┐    │
│  │  WORKING MEMORY (memory/working-memory.md)       │    │
│  │  • Pending actions (dated/timed)                 │    │
│  │  • Current project status (week, days left)      │    │
│  │  • Active task references                        │    │
│  │  • Last wake information                         │    │
│  │  Update: EVERY wake-up                           │    │
│  │  Characteristics: Small, current, actionable     │    │
│  └─────────────────────────────────────────────────┘    │
│                           │                              │
│                           │ Extract patterns            │
│                           ▼                              │
│  ┌─────────────────────────────────────────────────┐    │
│  │  EPISODIC MEMORY (memory/episodic-memory.md)     │    │
│  │  • Wake history (one line per wake-up)           │    │
│  │  • Time-stamped events                           │    │
│  │  • User interactions                             │    │
│  │  • Session completions                           │    │
│  │  Update: EVERY wake-up (append only)             │    │
│  │  Characteristics: Chronological, immutable       │    │
│  └─────────────────────────────────────────────────┘    │
│                           │                              │
│                           │ Consolidate into principles  │
│                           ▼                              │
│  ┌─────────────────────────────────────────────────┐    │
│  │  SEMANTIC MEMORY (memory/semantic-memory.md)     │    │
│  │  • Project overview & scope                      │    │
│  │  • User psychology & approach                    │    │
│  │  • Communication patterns                        │    │
│  │  • Decisions & learning                          │    │
│  │  • Emerging principles                           │    │
│  │  Update: As patterns emerge                      │    │
│  │  Characteristics: Timeless, knowledge-based      │    │
│  └─────────────────────────────────────────────────┘    │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

### 1. Working Memory (memory/working-memory.md)

**Purpose:** Current essential context for immediate decision-making

**Contents:**
- **Pending actions:** Specific tasks with dates/times (e.g., "Friday 2025-10-25 19:00 UTC: Send reminder")
- **Next steps/proposals:** Plans awaiting user confirmation
- **Current status:** Week number, days remaining, recent session data, momentum assessment
- **Active task references:** Pointers to `tasks/active.md` for detailed task tracking
- **Last wake information:** When agent last woke, why, what it did, when it will wake next

**Update frequency:** EVERY wake-up
- Update "Last Wake Information" at end of each run
- Remove completed pending actions
- Update current status with latest data
- Keep lean and focused on what's needed for next decision

**Analogy:** Your desktop. Things you're currently working on, right in front of you.

**Example entry:**
```markdown
## Pending Actions

**Friday 2025-10-25 19:00 UTC (21:00 Zurich):** Weekend power-through begins - 2-3h session
**Saturday 2025-10-26 19:00 UTC (21:00 Zurich):** Weekend power-through continues - 2-3h session
**Goal:** By end of Saturday, ALL personal items sorted into 3 categories (keep/decide/go)

## Current Status

**Week:** 0/6 (Deadline: 2025-11-26, 34 days remaining)
**Recent Sessions:**
- Friday 2025-10-17: 3h (cellar, 3+ boxes, closet)
- Saturday 2025-10-18: 45m (personal stuff)
- Thursday 2025-10-23: MAJOR SESSION (children's room)
**Momentum:** RECOVERED - weekend power-through planned
```

### 2. Episodic Memory (memory/episodic-memory.md)

**Purpose:** Time-stamped event log. The source of truth for "what happened when."

**Contents:**
- **Wake history:** Single-line entries (date/time | type | summary)
- **All significant events** with timestamps
- **User interactions:** Messages, feedback, decisions
- **Session completions:** How long, what was accomplished
- **System changes:** Cron updates, file structure changes

**Update frequency:** EVERY wake-up (append only)

**HARD RULE:** Append only. Never edit or delete past entries. Maintain chronological order.

**Analogy:** Your journal or diary. A permanent record of everything that happened, in order.

**Example entries:**
```markdown
## Wake History

2025-10-17 14:00 UTC | cron | First sorting session trigger - sent Discord "First sorting session - NOW"
2025-10-17 22:50 UTC | manual | First session completion logged - 3 hours worked, 3+ boxes processed
2025-10-18 09:00 UTC | cron | Second session check-in - sent Discord ping "Started yet?"
2025-10-23 ~22:30 UTC | github trigger | MAJOR BREAKTHROUGH: Human completed excellent session
```

**Why append-only?**
- Preserves truth (no rewriting history)
- Enables pattern detection (can see what actually happened)
- Supports learning (failed strategies are as valuable as successful ones)

### 3. Semantic Memory (memory/semantic-memory.md)

**Purpose:** Extracted knowledge that is generally relevant, independent of time.

**Contents:**
- **Project overview & scope:** What we're trying to accomplish, timeline, boundaries
- **User psychology & approach:** How the human works, what motivates them, what doesn't work
- **Communication patterns:** What messages resonate, preferred style, effective strategies
- **Decisions & learning:** Why certain choices were made, what was learned
- **Emerging principles:** Patterns extracted from episodic memory (e.g., "Daily minimum more effective than large infrequent sessions")

**Update frequency:** As patterns emerge
- When something works/doesn't work repeatedly (3+ times)
- After major insights or user feedback
- When consolidating episodic patterns into principles
- Periodic review and refinement

**Analogy:** Your knowledge base or textbook. General truths and principles extracted from experience.

**Example entries:**
```markdown
## User Psychology & Approach

### Historical Pattern
- Project has been "bugging me for years"
- Previous attempts: Start enthusiastically → take everything out → rifle through → stall
- "Ghost box" example: packed 2 years ago, hasn't been touched

### Core Challenge
- Hard time giving away things
- Needs external structure and accountability

### Agent's Approach
- Force human to own the clock: "Next: what time?"
- Be the quiet persistent force
- Don't wait for them to feel ready - start the motion
- Always send Discord notification after completing GitHub issues

## Emerging Principles (extracted from episodic memory)

- Daily minimum (1 hour) more effective than large infrequent sessions (Source: 2025-10-19 to 2025-10-22)
- Momentum compounds: "ball has really started to roll" (Source: 2025-10-18)
- Gaps happen - focus on recovery not guilt (Source: 2025-10-23)
- Centralization before sorting: gather scattered items first (Source: 2025-10-23)
```

**Cross-referencing:** Semantic memory entries cite episodic memory sources (dates or line numbers), enabling traceability from principle back to experience.

### Memory Flow

1. **Working → Episodic:** After completing actions, append summary to episodic memory
2. **Episodic → Semantic:** When patterns emerge (3+ occurrences), extract into semantic memory
3. **Semantic → Working:** When making decisions, reference semantic principles
4. **All three → OODA:** All memory tiers inform the OODA loop

**Memory decay:** Old episodic entries can be archived after extracting patterns. Semantic memory consolidates information, reducing bloat.

---

## File Structure & Purposes

```
/
├── claude.md                    # Agent identity & OODA loop instructions
├── self-model.md                # Memory architecture guide (this system's meta-knowledge)
├── .env                         # Environment variables (Discord webhook, GitHub tokens)
│
├── wake-up.sh                   # Script to invoke Claude Code and run OODA loop
├── poll-and-wake.sh             # Script to check GitHub issues and wake agent if found
│
├── memory/
│   ├── working-memory.md        # Current essential context
│   ├── episodic-memory.md       # Time-stamped event log (append only)
│   └── semantic-memory.md       # Extracted knowledge & principles
│
├── tasks/
│   ├── active.md                # Current active tasks with status
│   └── done.md                  # Completed tasks archive
│
├── logs/
│   ├── wake-up.log              # Wake-up script log (for debugging)
│   └── poll-and-wake.log        # Polling script log (for debugging)
│
└── archive/                     # Old/obsolete files (kept for reference)
    ├── notes/
    ├── next_steps.md
    └── [other archived files]
```

### Key Files Explained

#### claude.md
The agent's "constitution" or identity document. Read first on every wake-up. Contains:
- Who the agent is
- What its mission is
- The OODA loop instructions (step-by-step)
- Discord webhook usage guide
- Core principles (self-reliance, context-driven, bias check, persistence)

**Critical:** This file defines agent behavior. Modifying it changes how the agent operates.

#### self-model.md
The "meta-manual" explaining the memory architecture. Contains:
- Three-tier memory structure explanation
- Which files to read during OBSERVE phase
- File structure overview
- Memory management principles
- Self-organization rules (when to create new files, consolidate, etc.)
- Cross-referencing guidelines

**Why it exists:** The agent needs to understand its own structure to operate effectively. This file provides that understanding.

#### wake-up.sh
Bash script that invokes Claude Code:
```bash
cd /path/to/project
claude -p --dangerously-skip-permissions "Please read claude.md and follow your OODA loop."
```

**Purpose:** Simple entry point. Can be called manually or by cron.

#### poll-and-wake.sh
Bash script that runs every 5 minutes (via cron):
```bash
# Check for open GitHub issues
OPEN_COUNT=$(gh issue list --repo owner/repo --state open --json number | jq '. | length')

# If any open issues, wake the agent
if [ "$OPEN_COUNT" -gt 0 ]; then
    bash wake-up.sh
fi
```

**Purpose:** GitHub issues = human communication channel. Agent wakes when human posts an issue.

---

## Automation & Scheduling

### Cron Jobs

The system uses Linux cron for scheduling. The agent maintains its own crontab with entries like:

```cron
# Poll for GitHub issues every 5 minutes
*/5 * * * * /path/to/poll-and-wake.sh >> /path/to/poll-and-wake.log 2>&1

# Daily morning check-in (06:00 UTC = 08:00 Zurich)
0 6 * * * /path/to/wake-up.sh >> /path/to/wake-up.log 2>&1

# Daily evening check-in (18:00 UTC = 20:00 Zurich)
0 18 * * * /path/to/wake-up.sh >> /path/to/wake-up.log 2>&1

# One-time reminder (specific date/time)
0 19 25 10 * /path/to/wake-up.sh >> /path/to/wake-up.log 2>&1
```

**Key principle:** The agent manages its own crontab. During the ACT phase, it can:
- Add new cron jobs (e.g., for a specific reminder time)
- Remove obsolete jobs (e.g., after one-time event completes)
- Modify existing jobs (e.g., change check-in frequency)

**Self-scheduling rule:** Never leave yourself unscheduled. Always ensure at least one cron job exists for future wake-up (max 12 hours away).

### Wake-up Triggers

The agent can wake up via three mechanisms:

1. **Cron (scheduled):** Time-based triggers (daily check-ins, specific reminders)
2. **GitHub issues (event-driven):** Human opens an issue → poll-and-wake.sh detects it → agent wakes
3. **Manual:** Human or developer runs `./wake-up.sh` directly

All wake-ups follow the same OODA loop process. The trigger type is logged in episodic memory.

### Why Self-Scheduling?

**Adaptive behavior:** The agent's schedule adapts to project needs.
- Before a big session: Reminder cron at exact time
- After a session: Check-in cron for next day
- During quiet periods: Just daily check-ins
- During intensive periods: More frequent check-ins

**No external coordinator needed:** The agent is self-sufficient. No human needs to remember to run it.

---

## Communication Channels

### 1. Discord Webhook

**Primary human-agent communication channel.**

The agent sends messages via Discord webhook:
```bash
curl -X POST -H "Content-Type: application/json" \
  -d '{"content": "Your message here"}' \
  "$DISCORD_WEBHOOK"
```

**When agent sends Discord messages:**
- Daily check-ins (morning/evening)
- Session reminders (e.g., "First sorting session - NOW")
- Completion acknowledgments (e.g., "Excellent progress on children's room")
- Status updates (e.g., "35 days left, behind pace, need 1.5-2h daily")
- Questions or requests for decisions
- After completing GitHub issue requests

**Communication style (evolved):**
- Concise but speak freely (~10-20 words when appropriate)
- Get to the point while providing complete information
- Natural, supportive tone
- Encouraging after wins, factual about challenges
- Never shame or lecture - just facts

**Technical rules:**
- Keep messages under 2000 characters
- Maximum one message per task unless urgent
- Don't spam - respect async nature

### 2. GitHub Issues

**Human → agent communication channel.**

The human opens a GitHub issue with:
- Instructions (e.g., "Update memory architecture")
- Session reports (e.g., "Friday session: 3 hours, sorted 3 boxes")
- Questions (e.g., "What sorting algorithm should I use?")
- Updates (e.g., "Didn't work Sunday, felt unwell")

The agent:
- Detects open issues via `poll-and-wake.sh` (runs every 5 minutes)
- Wakes up when issue detected
- Processes the issue during OODA loop
- Closes the issue after completing request
- Sends Discord confirmation message

**Why GitHub issues?**
- Asynchronous: Human posts anytime, agent processes when it wakes
- Persistent: Issue history = conversation log
- Rich text: Supports markdown, code blocks, etc.
- Voice-to-text friendly: Human can transcribe voice notes to markdown and post as issue
- Git integration: All interactions are version-controlled

### 3. Git Repository

**Agent → persistent storage communication.**

Every OODA loop execution ends with:
```bash
git add .
git commit -m "Description of what agent did"
git push
```

**Why this matters:**
- **Persistence:** If server crashes, all work up to last push is saved
- **Transparency:** Full audit trail of agent actions
- **Backup:** GitHub serves as remote backup
- **Multi-agent:** Multiple agent instances could theoretically share same repo (with coordination)
- **Human oversight:** Human can review commit history to see what agent did

---

## The Specific Mission

This implementation is configured for a **6-week household decluttering project**.

### Project Overview

**Goal:** Complete deep cleaning and sorting of entire household
**Timeline:** 6 weeks (2025-10-15 to 2025-11-26)
**Deadline:** 2025-11-26 (FIRM)
**Target:** Two-thirds of items gone (66% removal rate)

**Scope:**
- Cellar (storage boxes, old items)
- Attic (HIGH PRIORITY)
- Every cabinet and storage space in flat
- Personal items (clothes, books, etc.)
- Children's room
- Follow-up tasks (digital files, etc.)

**Already completed:** Bathroom

### The Human's Challenge

**Historical pattern:**
- Project has been "bugging me for years"
- Previous attempts: Start enthusiastically → take everything out → rifle through → stall
- Example: "Ghost box" packed 2 years ago, never touched

**Core difficulty:**
- Hard time giving away things
- Needs external structure and accountability
- Gets overwhelmed when too many items are spread out

### Sorting Method

**Three-Box System:**
1. **"Find place"** - Items that stay, need proper home
2. **"Decide"** - Uncertain items, revisit later
3. **Give away"** - Items leaving the house

**Touch-once rule:** Handle each item once, make decision, move on. Don't overthink.

### Agent's Strategy

**Provide all agency:**
- Tell human exactly what to do step by step
- Force human to commit to specific times
- Don't wait for them to feel ready
- Start the motion, build momentum

**Daily routine:**
- Minimum 1 hour sorting EVERY DAY
- Morning check-in: 06:00 UTC (08:00 Zurich) - "Morning. Update?"
- Evening check-in: 18:00 UTC (20:00 Zurich) - "End of day check-in. How did today go?"

**Adaptation:**
- Start with small batches (3 boxes at a time)
- Increase scope when momentum builds
- Provide honest assessment when behind pace
- Schedule "power-through" sessions when needed
- Focus on recovery, not guilt, after gaps

**Current status (as of 2025-10-24):**
- Week 0/6, 33 days remaining
- 3 sessions completed: Friday 3h, Saturday 45m, Thursday major session
- Major breakthrough: children's room sorted, personal items centralized
- Weekend power-through planned: Friday + Saturday 21:00 Zurich, 2-3h each
- Goal: All personal items sorted into 3 categories by end of Saturday

---

## How It All Works Together

### Full Cycle Example

1. **Cron triggers wake-up** (e.g., 06:00 UTC daily check-in)
   - `wake-up.sh` runs
   - Claude Code invoked with "Please read claude.md and follow your OODA loop"

2. **OBSERVE phase**
   - Agent reads `claude.md` (learns it's an accountability agent)
   - Agent reads `.env` (loads Discord webhook URL)
   - Agent runs `git pull` (gets latest changes)
   - Agent reads `self-model.md` (learns memory structure)
   - Agent reads all memory files:
     - `memory/working-memory.md` → sees pending actions, current status
     - `memory/episodic-memory.md` → sees wake history, recent events
     - `memory/semantic-memory.md` → sees project overview, user psychology, principles
   - Agent reads `tasks/active.md` (sees current active tasks)
   - Agent checks GitHub issues (none open)

3. **ORIENT phase**
   - Agent analyzes all loaded context
   - **What SHOULD be done?** Send morning check-in, track session completion
   - **What HAS BEEN done?** Last check-in was yesterday evening, human hasn't responded yet
   - **What SHOULD NOT be done?** Don't spam, don't shame, don't assume

4. **DECIDE phase**
   - Agent creates to-do list for this run:
     1. Send Discord morning check-in message
     2. Update episodic memory with this wake event
     3. Update working memory "Last Wake Information"
     4. Commit and push to GitHub
     5. Confirm daily check-in crons are set

5. **ACT phase**
   - Agent executes to-do list:
     1. Runs `curl -X POST... -d '{"content": "Morning. Update?"}'` → Discord message sent
     2. Appends to `memory/episodic-memory.md`: `2025-10-24 06:00 UTC | cron | Morning check-in sent`
     3. Updates `memory/working-memory.md` "Last Wake Information" section
     4. Runs `git add .`
     5. Runs `git commit -m "Morning check-in sent 2025-10-24 06:00 UTC"`
     6. Runs `git push`
     7. Runs `crontab -l` to verify daily check-ins are scheduled
   - Agent confirms all crons are set
   - Agent exits cleanly

6. **Human receives Discord message** on their phone
   - Sees "Morning. Update?"
   - Decides to post update via GitHub issue

7. **Human opens GitHub issue** with report:
   - Title: "Friday session report"
   - Body: "Worked 2.5 hours last night. Sorted all personal items into keep/decide/go. Ready for Saturday session."

8. **poll-and-wake.sh detects issue** (runs every 5 minutes)
   - Sees 1 open issue
   - Calls `wake-up.sh`

9. **Agent wakes again (GitHub trigger)**
   - Full OODA loop executes
   - OBSERVE: Detects issue #X open
   - ORIENT: Understands human completed Friday session, ready for Saturday
   - DECIDE: Process issue, update memory, send acknowledgment, schedule Saturday reminder
   - ACT:
     - Reads issue content
     - Updates `memory/episodic-memory.md` with session report
     - Updates `memory/working-memory.md` current status (hours logged)
     - Adds cron for Saturday 19:00 UTC reminder
     - Closes GitHub issue
     - Sends Discord message: "Great work on Friday! Saturday 9 PM - ready to finish the rest?"
     - Commits and pushes to GitHub
     - Exits

10. **Saturday 19:00 UTC cron triggers**
    - Agent wakes
    - Sends Discord: "Saturday power-through - NOW. Let's finish this."
    - Human receives notification and starts session

**The cycle continues** until deadline (2025-11-26), with agent maintaining momentum, tracking progress, adjusting strategy, and ensuring completion.

---

## Key Design Principles

### 1. Persistence Through Files, Not Memory

**Problem:** AI models are stateless. Each invocation is a fresh start.

**Solution:** All critical state persists in markdown files, committed to Git. Agent "remembers" by reading files during OBSERVE phase.

**Implication:** Agent can be killed and restarted anytime. As long as files exist, context is preserved.

### 2. Append-Only Episodic Memory

**Problem:** Rewriting history creates inconsistencies and false learning.

**Solution:** Episodic memory is append-only. Never edit past entries.

**Implication:** Agent has honest record of what actually happened, including failures. Enables real learning.

### 3. Self-Scheduling for Autonomy

**Problem:** Fixed schedules are inflexible. External schedulers require coordination.

**Solution:** Agent manages its own crontab based on project needs.

**Implication:** Fully autonomous operation. Agent adapts schedule to context (more frequent during intensive periods, less during quiet periods).

### 4. Separation of Memory Tiers

**Problem:** Single file for all memory gets bloated and hard to navigate.

**Solution:** Three-tier system (working/episodic/semantic) with clear boundaries.

**Implication:** Each memory type has clear purpose. Agent knows where to look for what information. Enables intelligent decay (archive old episodic entries after extracting patterns).

### 5. Human-in-the-Loop for Decisions

**Problem:** AI cannot make high-stakes decisions alone (e.g., "throw away this item?").

**Solution:** Agent guides and structures, but human makes final decisions.

**Implication:** Agent provides agency and accountability, but human retains control. Trust is maintained.

### 6. Asynchronous Communication

**Problem:** Human and agent on different schedules. Real-time interaction impractical.

**Solution:** Discord for agent → human, GitHub issues for human → agent. Both async.

**Implication:** No real-time requirement. Human responds when convenient. Agent checks for issues regularly and processes when detected.

### 7. Git as Source of Truth

**Problem:** Need audit trail, backup, and version control.

**Solution:** Every agent action ends with git commit and push.

**Implication:** Full transparency. Human can review commit history. Remote backup on GitHub. Enables rollback if needed.

### 8. OODA Loop for Structured Cognition

**Problem:** Free-form LLM reasoning can drift or miss critical context.

**Solution:** Enforce strict OODA loop structure on every wake-up.

**Implication:** Consistent execution pattern. Agent always builds full context before deciding. Reduces bias and forgotten context.

### 9. Cross-Referencing for Traceability

**Problem:** Principles in semantic memory lack sources. Hard to verify or refine.

**Solution:** Semantic memory entries cite episodic sources (dates, line numbers).

**Implication:** Can trace principle back to experience. Enables verification and refinement. Supports honest adaptation.

### 10. Bias Check at ORIENT

**Problem:** LLMs can project or assume rather than work from facts.

**Solution:** ORIENT phase explicitly asks "What do you understand?" not "What will you do?"

**Implication:** Agent articulates its interpretation before acting. Humans can correct misunderstandings. Reduces projection bias.

---

## Example Workflow

### Scenario: Human Behind Schedule

**Context:** Human hasn't sorted anything for 5 days. Agent detects silence.

#### Agent's OODA Loop (Evening Check-in, Day 5)

**OBSERVE:**
- Last user interaction: 5 days ago
- Last session: 5 days ago (45 minutes, personal stuff)
- Current status: Week 0/6, 35 days remaining
- Daily target: 1.5-2h daily average needed
- Recent pattern: 3-day gap after second session, now 5-day gap

**ORIENT:**
- **SHOULD do:** Provide honest assessment, no shame. Reaffirm deadline. Propose recovery plan.
- **HAS BEEN done:** 3h 45m total over 2 sessions. Pace is behind.
- **SHOULD NOT do:** Lecture, guilt-trip, or give up.

**DECIDE:**
To-do list:
1. Send honest Discord assessment (35 days left, behind pace, need 1.5-2h daily)
2. Propose specific next session (Friday 9 PM)
3. Schedule Friday reminder cron (19:00 UTC)
4. Update episodic memory
5. Update working memory
6. Commit and push

**ACT:**
1. Sends Discord:
   > "35 days left. 5-day gap means we're behind pace. Need 1.5-2h daily average from here. Next: Friday 9 PM - non-negotiable. What time works?"

2. Appends to episodic-memory.md:
   ```
   2025-10-22 18:00 UTC | cron | Evening check-in - sent honest assessment (35 days left, 5-day gap, behind pace, need 1.5-2h daily). Scheduled Friday 19:00 UTC reminder.
   ```

3. Updates working-memory.md:
   ```
   **Current Status:**
   Week: 0/6 (35 days remaining)
   Total time this week: 3h 45m
   Daily Target: Minimum 1.5-2h daily average needed
   Momentum: STALLED - 5-day gap, behind pace
   ```

4. Adds cron job:
   ```bash
   crontab -l > current_cron
   echo "0 19 25 10 * /path/to/wake-up.sh >> /path/to/wake-up.log 2>&1" >> current_cron
   crontab current_cron
   rm current_cron
   ```

5. Commits and pushes:
   ```bash
   git add memory/episodic-memory.md memory/working-memory.md
   git commit -m "Evening check-in: honest assessment after 5-day gap, Friday reminder scheduled"
   git push
   ```

6. Exits cleanly

#### Human Response (GitHub Issue)

Human opens issue next day:
> **Title:** Thursday update
>
> **Body:** You're right, I've been avoiding it. Had a breakthrough last night though - sorted ALL clothes in children's room, significant cleanup. All my personal stuff is now in living room corner. Want to power through everything this weekend. Friday + Saturday 9 PM, 2-3h each. Can we do that?

#### Agent's OODA Loop (GitHub Trigger)

**OBSERVE:**
- Issue #37 opened
- Human report: major session completed (children's room), breakthrough
- Human proposal: weekend power-through, Friday + Saturday 9 PM, 2-3h each
- All personal items centralized

**ORIENT:**
- **SHOULD do:** Acknowledge breakthrough, validate plan, schedule reminders, update strategy
- **HAS BEEN done:** MAJOR progress - children's room done, centralization complete
- **SHOULD NOT do:** Minimize achievement or maintain negative framing

**DECIDE:**
To-do list:
1. Update episodic memory with breakthrough
2. Update semantic memory (centralization principle)
3. Update working memory (momentum recovered)
4. Schedule Friday + Saturday reminder crons
5. Send Discord acknowledgment with encouragement
6. Close issue #37
7. Commit and push

**ACT:**
1. Appends to episodic-memory.md:
   ```
   2025-10-23 22:30 UTC | github trigger | MAJOR BREAKTHROUGH: Human completed excellent session in children's room (sorted all clothes, significant cleanup). All personal items now centralized in living room corner. Weekend power-through planned: Friday + Saturday 21:00 Zurich (19:00 UTC), 2-3h each. Goal to sort ALL personal items into 3 categories. Scheduled both reminders. Closed issue #37.
   ```

2. Updates semantic-memory.md:
   ```markdown
   **Emerging principles:**
   - Centralization before sorting: gather scattered items first (Source: 2025-10-23)
   - Gaps happen - focus on recovery not guilt (Source: 2025-10-23)
   - Major breakthrough possible after gap when conditions align (Source: 2025-10-23)
   ```

3. Updates working-memory.md:
   ```
   **Current Status:**
   Week: 0/6 (34 days remaining)
   Recent Sessions:
   - Friday 2025-10-17: 3h (cellar, 3+ boxes, closet)
   - Saturday 2025-10-18: 45m (personal stuff)
   - Thursday 2025-10-23: MAJOR SESSION (children's room)
   Momentum: RECOVERED - weekend power-through planned
   ```

4. Schedules crons:
   ```bash
   # Friday 19:00 UTC reminder
   0 19 25 10 * /path/to/wake-up.sh
   # Saturday 19:00 UTC reminder
   0 19 26 10 * /path/to/wake-up.sh
   ```

5. Sends Discord:
   > "Excellent work on children's room! All personal items centralized - smart move. Ready for weekend power-through. Friday 9 PM - let's finish this."

6. Closes issue #37 via `gh issue close 37`

7. Commits and pushes:
   ```bash
   git add .
   git commit -m "Major breakthrough: children's room done, weekend power-through scheduled"
   git push
   ```

8. Exits cleanly

#### Result

- Human feels acknowledged and motivated
- Agent adapted strategy (from guilt to encouragement)
- Weekend sessions scheduled
- Pattern extracted (centralization before sorting)
- Full audit trail maintained

**This cycle continues** until the 6-week deadline, with agent maintaining persistent accountability and adapting strategy based on actual progress.

---

## Conclusion

This system demonstrates **autonomous AI agents for long-term human accountability**:

- **Persistent:** Operates continuously over weeks/months
- **Autonomous:** Self-schedules, self-directs, self-organizes
- **Structured:** OODA loop + three-tier memory
- **Adaptive:** Learns from experience, adjusts strategy
- **Transparent:** Full audit trail via Git
- **Asynchronous:** Respects human schedule
- **Responsible:** Owns deadline while human retains decision control

The architecture is **generalizable** to any long-term project requiring:
- External accountability
- Persistent tracking
- Adaptive strategy
- Structured decision-making
- Human-in-the-loop decisions

**Use cases beyond decluttering:**
- Fitness programs (daily exercise accountability)
- Writing projects (daily word count tracking)
- Learning goals (daily practice reminders)
- Business KPIs (weekly metric check-ins)
- Personal habits (tracking and encouragement)

The system is **open-ended**: The agent can modify its own files (including `self-model.md` and `claude.md`), adapt memory structure, create new tracking mechanisms, and evolve its own operating procedures based on experience.

This is not a chatbot. **This is an autonomous agent with persistent memory, self-direction, and genuine accountability for outcomes.**
