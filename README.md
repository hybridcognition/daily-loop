# Daily Loop

An autonomous life management agent that maintains complete cognitive control through proactive memory management and persistent accountability.

## Overview

Daily Loop is an AI agent that runs continuously on a server, managing your mental load, tracking active work, monitoring task health, and providing proactive reminders before things are due. It operates via OODA loop (Observe-Orient-Decide-Act) and communicates asynchronously through Discord and GitHub.

**Core capabilities:**
- **Proactive accountability:** Reminds you BEFORE things are due
- **Task decay detection:** Flags tasks that haven't moved in 7+ days
- **Context-aware filtering:** Surfaces what matters based on your current focus/energy
- **Persistent memory:** Dual memory system (agent cognition + your life state)
- **Autonomous operation:** Self-schedules, manages cron jobs, pushes to GitHub

For complete system documentation, see [`intro.md`](intro.md).

---

## Quick Start

### Prerequisites

- Linux server (Ubuntu recommended)
- Claude Code CLI installed
- GitHub CLI (`gh`) installed
- Discord webhook configured
- Git configured with SSH keys for GitHub

### Installation

1. **Clone this repository:**
   ```bash
   cd ~
   git clone git@github.com:hybridcognition/daily-loop.git
   cd daily-loop
   ```

2. **Configure environment:**
   ```bash
   cp .env.template .env
   nano .env  # Add your Discord webhook URL
   ```

3. **Create logs directory:**
   ```bash
   mkdir -p ~/daily-loop/logs
   ```

4. **First run (manual):**
   ```bash
   ./wake-up.sh
   ```

   The agent will:
   - Read `claude.md` and execute OODA loop
   - Install cron jobs (morning 7am, evening 9pm, GitHub polling every 5min)
   - Send Discord welcome message
   - Wait for your first GitHub issue

5. **Initialize project memory:**

   Create a GitHub issue with your tasks, context, and mental load. The agent will extract and organize everything automatically.

   Example issue:
   ```
   Current focus: Autopoiesis project launch
   Energy: High bandwidth this week

   Tasks:
   - Finalize autopoiesis whitepaper
   - Schedule investor meetings
   - Review Q1 financials

   Mental load:
   - Monday: Team sync at 10am
   - 1st of month: Submit timesheets
   ```

---

## How It Works

### OODA Loop

Every wake-up follows: **Observe → Orient → Decide → Act**

1. **Observe:** Load all memory files, check GitHub issues, note changes
2. **Orient:** Answer what SHOULD be done, HAS BEEN done, SHOULD NOT be done
3. **Decide:** Create specific to-do list for this session
4. **Act:** Execute everything, update memory, commit to GitHub, verify cron schedule

### Memory Architecture

**Two parallel memory systems:**

**agent-memory/** (Agent's internal cognition)
- `working-memory.md` - Current operational context
- `episodic-memory.md` - Time-stamped system log
- `semantic-memory.md` - Operational principles

**project-memory/** (Your life state)
- `mental-load.md` - Recurring responsibilities
- `context.md` - Current focus/energy/constraints
- `active.md` - Hot tasks (max 5-7)
- `backlog.md` - Queued tasks
- `archive.md` - Decayed tasks

### Communication

**Discord (Agent → You):**
- Morning summary (7am): What's hot today
- Evening reflection (9pm): How did today go?
- Task decay warnings (7/10/14 days)
- Proactive reminders (mental-load items due soon)

**GitHub Issues (You → Agent):**
- Post tasks, context updates, voice transcripts
- Agent extracts, organizes, closes issue with summary
- Fully asynchronous

---

## Daily Usage

### Adding Tasks

Create a GitHub issue:
```
New tasks:
- Research competitor landscape
- Draft Q2 roadmap
- Schedule dentist appointment
```

Agent extracts, adds to `project-memory/active.md`, closes issue, sends Discord confirmation.

### Updating Context

Create a GitHub issue:
```
Context update:
Low bandwidth this week - kids are sick, working reduced hours
```

Agent updates `project-memory/context.md`, adjusts what it surfaces.

### Adding Recurring Responsibilities

Create a GitHub issue:
```
Mental load:
- Every Monday: Take out trash
- 15th of month: Submit invoice to client X
```

Agent adds to `project-memory/mental-load.md`, will remind you proactively.

### Responding to Task Decay

When agent sends:
> ⚠️ "Research competitor landscape" hasn't moved in 7 days. Still relevant?

Reply via GitHub issue:
```
keep  # Agent updates last-touched date
```
or
```
backlog  # Moves to backlog
```
or
```
archive  # Archives the task
```

---

## File Structure

```
~/daily-loop/
├── claude.md                # Agent identity & OODA loop
├── self-model.md            # Memory architecture guide
├── intro.md                 # Complete system documentation
├── README.md                # This file
├── .env                     # Configuration (not in git)
├── .env.template            # Template for .env
├── wake-up.sh               # Wake-up script
├── poll-and-wake.sh         # GitHub issue poller
│
├── agent-memory/            # Agent's internal cognition
│   ├── working-memory.md
│   ├── episodic-memory.md
│   └── semantic-memory.md
│
├── project-memory/          # Your life state
│   ├── mental-load.md
│   ├── context.md
│   ├── active.md
│   ├── backlog.md
│   └── archive.md
│
└── logs/                    # System logs
    ├── wake-up.log
    └── poll-and-wake.log
```

---

## Cron Schedule

Agent manages its own crontab. Standard schedule:

```cron
SHELL=/bin/bash
TZ=Europe/Zurich

# Morning wake-up: 7:00 AM Zurich time
0 7 * * * cd ~/daily-loop && ./wake-up.sh >> ~/daily-loop/logs/wake-up.log 2>&1

# Evening wake-up: 9:00 PM Zurich time
0 21 * * * cd ~/daily-loop && ./wake-up.sh >> ~/daily-loop/logs/wake-up.log 2>&1

# GitHub polling: Every 5 minutes
*/5 * * * * cd ~/daily-loop && ./poll-and-wake.sh >> ~/daily-loop/logs/poll-and-wake.log 2>&1
```

View current schedule:
```bash
crontab -l
```

---

## Monitoring

### View Recent Activity

```bash
tail -f ~/daily-loop/logs/wake-up.log
```

### Check Agent Memory

```bash
cat ~/daily-loop/agent-memory/episodic-memory.md  # System log
cat ~/daily-loop/agent-memory/working-memory.md   # Current state
```

### Check Your Project State

```bash
cat ~/daily-loop/project-memory/active.md      # Hot tasks
cat ~/daily-loop/project-memory/context.md     # Current focus
cat ~/daily-loop/project-memory/mental-load.md # Recurring items
```

### Manual Wake-Up

```bash
cd ~/daily-loop
./wake-up.sh
```

---

## Troubleshooting

### Agent Not Waking Up

1. Check cron is running: `crontab -l`
2. Check logs: `tail -f ~/daily-loop/logs/wake-up.log`
3. Test manual wake: `./wake-up.sh`

### Discord Not Receiving Messages

1. Verify webhook URL in `.env`
2. Test webhook:
   ```bash
   source .env
   curl -X POST -H "Content-Type: application/json" \
     -d '{"content": "Test message"}' \
     "$DISCORD_WEBHOOK"
   ```

### GitHub Issues Not Triggering Wake-Up

1. Check polling log: `tail -f ~/daily-loop/logs/poll-and-wake.log`
2. Verify GitHub CLI auth: `gh auth status`
3. Test issue list: `gh issue list --repo hybridcognition/daily-loop`

---

## Configuration

### Change Check-In Times

Edit crontab:
```bash
crontab -e
```

Example: Change morning to 8am, evening to 10pm:
```cron
0 8 * * * cd ~/daily-loop && ./wake-up.sh >> ~/daily-loop/logs/wake-up.log 2>&1
0 22 * * * cd ~/daily-loop && ./wake-up.sh >> ~/daily-loop/logs/wake-up.log 2>&1
```

Agent will adapt to new schedule.

### Adjust Task Decay Thresholds

Edit `claude.md`, section "Task Decay Detection". Current defaults:
- 7 days: Flag as stale
- 10 days: Escalate
- 14 days: Move to backlog automatically

---

## Architecture

Daily Loop is an **obligate mutualism** system:
- Agent handles distributed memory and coordination
- Human focuses on synthesis and decision-making
- Agent doesn't wait for you to feel ready—it creates structure and maintains momentum

Key principles:
1. **Proactive over reactive:** Remind before things are due
2. **Context-aware:** Filter based on your current energy/focus
3. **Truth-telling:** Honest assessments without guilt
4. **Friction asymmetry:** Input is trivial for you, agent claims space via interruptions
5. **Decay detection:** Surface tasks lingering without progress
6. **No assumptions:** Update from observed behavior only

For complete architecture details, see [`intro.md`](intro.md).

---

## Credits

Built on Claude Code with autonomous agent architecture inspired by OODA loop (John Boyd) and three-tier memory systems (cognitive science).

## License

MIT

---

## Support

For issues or questions, open a GitHub issue at: https://github.com/hybridcognition/daily-loop/issues
