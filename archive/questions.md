# Daily Loop Transformation - Clarifying Questions

Please answer each question by selecting one option (A, B, C, or D). You can also add notes if needed.

---

## 1. Execution Timeline

**Question:** When should I execute this transformation?

- [ ] A) Execute the full transformation immediately in this session
- [X] B) Prepare all files but don't activate (let me review first)
- [ ] C) Execute in phases (files first, then test, then activate crons)
- [ ] D) This is aspirational documentation only, don't execute yet



**Your answer:** B

**Notes (optional):** Rewrite all files immediately, set up the full agent, but do not activate cron yet

---

## 2. Existing Decluttering Project

**Question:** What should happen to the current decluttering project?

- [X] A) Project is complete - archive everything and start fresh
- [ ] B) Project continues - migrate to project-memory/active.md alongside new life tasks
- [ ] C) Project continues - keep in separate tracking, don't mix with new Daily Loop tasks
- [ ] D) Project is paused - move to project-memory/backlog.md

**Your answer:** A

**Notes (optional):** The decluttering agent is only the starting point for this new agent, this project does not need to be reflected here.

---

## 3. Timezone Handling for Fixed Check-ins

**Question:** How should I handle timezone for morning (7am Zurich) and evening (9pm Zurich) crons?

- [ ] A) Use 6:00 UTC and 20:00 UTC year-round (as specified in instructions)
- [ ] B) Adjust crons seasonally for Zurich DST (5:00/19:00 UTC summer, 6:00/20:00 UTC winter)
- [X] C) Use local time in cron with TZ=Europe/Zurich
- [ ] D) Make both times configurable via .env file

**Your answer:** C

**Notes (optional):** Use local time, the timing of checkings etc. will develop through my interaction with the agent and needs to be written into the agent-memory, not env files

---

## 4. Discord Message Style - Emojis

**Question:** Should Discord messages include emojis?

- [ ] A) Use emojis as shown in instructions (🌅 🌙 ⚠️ ✓ etc.)
- [ ] B) Remove all emojis, use plain text only
- [ ] C) Use emojis only for morning/evening summaries, not ad-hoc messages
- [X] D) Ask user preference via first Discord message after transformation

**Your answer:** D

**Notes (optional):** Instruct the agent to write as it wants naturally, then we will develop it together

---

## 5. CLI Command Syntax

**Question:** The instructions show `claude-code --profile daily-loop --execute` but existing system uses `claude -p --dangerously-skip-permissions`. Which should I use?

- [X] A) Keep existing syntax: `claude -p --dangerously-skip-permissions "message"`
- [ ] B) Use instruction syntax: `claude-code --profile daily-loop --execute "message"`
- [ ] C) Update to: `claude -p "message"` (simpler, no dangerous flag)
- [ ] D) Keep existing for now, I'll update later manually

**Your answer:** A

**Notes (optional):** Important to use this precise syntax, and to accept the permission skip

---

## 6. Script Renaming

**Question:** Should I rename the GitHub polling script?

- [ ] A) Rename `poll-and-wake.sh` to `check-github.sh` as shown in instructions
- [X] B) Keep existing name `poll-and-wake.sh`
- [ ] C) Create new `check-github.sh`, deprecate old script
- [ ] D) Doesn't matter, keep whatever exists

**Your answer:** B

**Notes (optional):** keep the working script

---

## 7. Initial project-memory Population

**Question:** What should be in the project-memory files after transformation?

- [X] A) Leave all 5 project-memory files empty (headers only), wait for user GitHub issue
- [ ] B) Migrate current decluttering tasks to project-memory/active.md
- [ ] C) Pre-populate with inferred mental-load from existing memory (e.g., decluttering sessions)
- [ ] D) Create initial entries based on existing semantic-memory.md user psychology

**Your answer:** A

**Notes (optional):** Set everything up, but do not prepopulate. The decluttering project is totally seperate and should not at all be in the agent any more. Archive anything to do with it

---

## 8. Agent Memory Content

**Question:** The existing agent-memory/ has learned patterns about the user (decluttering psychology, communication style, etc.). What should happen to this knowledge?

- [ ] A) Keep all existing semantic-memory.md content (user psychology still relevant)
- [X] B) Archive old semantic-memory.md, start fresh with new learning
- [ ] C) Keep user psychology sections, remove decluttering-specific principles
- [ ] D) Consolidate into new section called "User Profile" in semantic-memory.md

**Your answer:** B

**Notes (optional):** Start with a fresh semantic-memory.md. Then do add the input on communication, but nothing else

---

## 9. Task Decay - No Response Scenario

**Question:** Instructions escalate stale tasks (7 days → 10 days → 14 days) but say "only archive with confirmation". If user never responds, what happens at day 14+?

- [ ] A) At day 14, if no response, automatically archive with note "no response after escalations"
- [ ] B) At day 14, if no response, keep escalating every 3 days indefinitely
- [X] C) At day 14, if no response, move to backlog (assume blocked, not dead)
- [ ] D) At day 14, if no response, stop mentioning but keep in active.md

**Your answer:** C

**Notes (optional):** Proactively work with tasks, and if I dont engage put it into backlog

---

## 10. Wake-up.sh Parameter Support

**Question:** Instructions show `wake-up.sh morning` syntax. Currently script takes no parameters. How should this work?

- [ ] A) Modify wake-up.sh to accept and pass parameter (morning/evening/github/reminder)
- [X] B) Keep simple wake-up.sh, let agent infer type from cron schedule
- [ ] C) Create separate scripts (wake-morning.sh, wake-evening.sh, etc.)
- [ ] D) Use environment variable DAILY_LOOP_WAKE_TYPE set by cron

**Your answer:** B

**Notes (optional):** All wake ups are the same. They point the agent to the claude.md file, from where it starts the ooda loop. No need for parameters etc.

---

## 11. Migration Backup

**Question:** How should I preserve the current system state before transformation?

- [ ] A) Create migration-backup/ folder with full copy of current state before transformation
- [X] B) No backup needed, git history is sufficient
- [ ] C) Create git branch "pre-daily-loop" before transformation
- [ ] D) Export current state to separate archive repo

**Your answer:** B

**Notes (optional):** This is a clone of a system that will keep running elsewhere, so no need for backups

---

## 12. First GitHub Issue After Transformation

**Question:** What should happen when user sends first issue to populate project-memory?

- [X] A) Agent extracts everything automatically, no confirmation needed
- [ ] B) Agent proposes extraction in Discord, waits for confirmation before committing
- [ ] C) Agent asks clarifying questions via Discord if uncertain about placement
- [ ] D) Agent populates files but keeps issue open for user to review and confirm

**Your answer:** A

**Notes (optional):** Memory management is agent duty, but the agent can always ask clarifying questions if it helps, but no duty to ask

---

## Additional Notes or Questions

Please add any additional context, concerns, or questions here:

Please write the full agent, turnkey, and create a github repository at hybridcognition/daily-loop, and push everything there once you are done. I will then pull it and initialize it on the right instance



