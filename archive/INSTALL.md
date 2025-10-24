```
═══════════════════════════════════════════════════════════════════════════════
                    CLOUD CODE AGENT - INSTALLATION GUIDE
                              Version 1.0 (2025)
═══════════════════════════════════════════════════════════════════════════════
```

## SYSTEM REQUIREMENTS

- Ubuntu Linux (or similar)
- Git installed and configured
- Claude Code CLI installed (`claude` command available)
- Cron daemon running
- Discord webhook URL (for notifications)
- GitHub repository with push access

---

## INSTALLATION INSTRUCTIONS

### STEP 1: Copy the Template

```bash
# Copy this entire folder to your desired location
cp -r /path/to/infra_agent-template /path/to/my-new-agent
cd /path/to/my-new-agent
```

### STEP 2: Configure Environment

Edit the `.env` file:

```bash
nano .env
```

**Required changes:**
- `DISCORD_WEBHOOK` - Your Discord webhook URL
- `GITHUB_REPO` - Your repository (format: username/repo-name)
- `GITHUB_BRANCH` - Your branch (usually `main` or `master`)
- `YOUR_USER` - Your Linux username (usually `ubuntu`)

**Example:**
```
DISCORD_WEBHOOK=https://discord.com/api/webhooks/123456789/AbCdEfGhIjKlMnOp
GITHUB_REPO=myusername/my-house-cleaning-agent
GITHUB_BRANCH=main
YOUR_USER=ubuntu
```

Save and exit (Ctrl+X, Y, Enter).

### STEP 3: Update wake-up.sh Path

Edit `wake-up.sh`:

```bash
nano wake-up.sh
```

**Change line 2** to match your new folder location:
```bash
cd /path/to/my-new-agent
```

Save and exit.

### STEP 4: Define Your Mission

Edit `claude.md`:

```bash
nano claude.md
```

**Line 13** - Replace `[INSERT YOUR SPECIFIC TASK HERE]` with your mission.

**Example:**
```
**Your mission:**
Complete a deep cleaning and reorganization of my house in 6 weeks.
One room per week. Send daily progress checks via Discord.
```

Save and exit.

### STEP 5: Create Your Project Overview

Create the overview file referenced in `memory.md`:

```bash
mkdir -p tasks logs notes
nano overview.md
```

**Example content:**
```markdown
# Project: House Deep Clean

**Timeline:** 6 weeks starting 2025-10-15
**Deadline:** 2025-11-26

## Rooms/Areas
1. Kitchen - Week 1
2. Living room - Week 2
3. Bedroom - Week 3
4. Bathroom - Week 4
5. Garage - Week 5
6. Office - Week 6

## Current Status
Starting fresh - nothing completed yet.

## Next Action
Begin kitchen assessment and create task breakdown.
```

Save and exit.

### STEP 6: Test the Agent

Run it manually first:

```bash
./wake-up.sh
```

**Check:**
- Does it run without errors?
- Check `wake.log` for output
- Did it send a Discord message?
- Did it create any files?

### STEP 7: Set Up Cron Schedule

Add initial cron job:

```bash
crontab -e
```

Add this line (runs every 12 hours at noon and midnight):

```
0 */12 * * * /path/to/my-new-agent/wake-up.sh
```

**IMPORTANT:** Use the FULL absolute path to `wake-up.sh`!

Save and exit.

Verify it's scheduled:

```bash
crontab -l
```

---

## OPTIONAL: GitHub Actions Wake-Up

To allow the agent to wake when you create GitHub issues:

### 1. Create webhook listener (simple Python):

```bash
nano webhook_listener.py
```

```python
#!/usr/bin/env python3
from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/wake', methods=['POST'])
def wake():
    subprocess.run(['/path/to/my-new-agent/wake-up.sh'])
    return 'Agent woken', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 2. Install Flask:

```bash
pip3 install flask
```

### 3. Run listener as background service:

```bash
nohup python3 webhook_listener.py &
```

### 4. Create GitHub Action in your repo:

Create `.github/workflows/wake-agent.yaml` in your GitHub repository:

```yaml
name: Wake Agent on Issue

on:
  issues:
    types: [opened]

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Send Webhook
        run: |
          curl -X POST http://YOUR-SERVER-IP:8080/wake
```

Replace `YOUR-SERVER-IP` with your Tailscale IP or domain.

---

## TROUBLESHOOTING

**Problem:** `claude: command not found`
- **Solution:** Install Claude Code CLI or add to PATH

**Problem:** Permission denied on `wake-up.sh`
- **Solution:** `chmod +x wake-up.sh`

**Problem:** Cron job doesn't run
- **Solution:** Check cron is running: `systemctl status cron`
- **Solution:** Check cron logs: `grep CRON /var/log/syslog`
- **Solution:** Verify absolute paths in crontab

**Problem:** Discord messages not sending
- **Solution:** Test webhook manually:
  ```bash
  curl -X POST -H "Content-Type: application/json" \
    -d '{"content": "Test message"}' \
    "YOUR_WEBHOOK_URL"
  ```

**Problem:** Git push fails
- **Solution:** Verify git credentials are configured
- **Solution:** Test: `git push` manually from the folder

**Problem:** Agent seems stuck or not doing anything
- **Solution:** Check `wake.log` for errors
- **Solution:** Read the todo list the agent created in its output
- **Solution:** Verify `memory.md` references exist

---

## DIRECTORY STRUCTURE AFTER SETUP

```
my-new-agent/
├── INSTALL.md              (this file)
├── claude.md               (agent identity - CONFIGURED)
├── .env                    (secrets - CONFIGURED)
├── memory.md               (memory architecture)
├── overview.md             (YOUR PROJECT - CREATED)
├── wake-up.sh              (wake script - PATH UPDATED)
├── wake.log                (execution log - auto-generated)
├── tasks/
│   ├── active.md
│   ├── completed.md
│   └── blocked.md
├── logs/
│   └── (daily logs created by agent)
└── notes/
    └── (agent notes)
```

---

## OPERATION

Once installed:

1. **Agent wakes** (via cron or GitHub Action)
2. **Reads** claude.md and follows OODA loop
3. **Acts** on tasks
4. **Pushes** changes to GitHub
5. **Schedules** next wake-up
6. **Sleeps**

You interact by:
- Creating GitHub issues
- Editing files and pushing
- Voice-to-text → push to repo
- Responding to Discord pings

---

## SUPPORT

No official support. This is a template. You're on your own, friend.

But that's the beauty of it.

---

```
═══════════════════════════════════════════════════════════════════════════════
                         END OF INSTALLATION GUIDE
                    Good luck. May your agent serve you well.
═══════════════════════════════════════════════════════════════════════════════
```
