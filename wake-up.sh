#!/bin/bash

# Daily Loop Wake-Up Script
# Invokes Claude Code to read claude.md and execute OODA loop

WORK_DIR=~/daily-loop
LOG_FILE="$WORK_DIR/logs/wake-up.log"

# Create logs directory if it doesn't exist
mkdir -p "$WORK_DIR/logs"

# Timestamp function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Go to work directory
cd "$WORK_DIR" || {
    log "ERROR: Cannot access work directory at $WORK_DIR"
    exit 1
}

log "=== Agent waking up ==="

# Invoke Claude Code in headless mode with full permissions
# Point it at claude.md which contains all instructions
claude -p --dangerously-skip-permissions "Please read claude.md and follow your OODA loop." >> "$LOG_FILE" 2>&1

CLAUDE_EXIT_CODE=$?

if [ $CLAUDE_EXIT_CODE -eq 0 ]; then
    log "=== Agent completed successfully ==="
else
    log "=== ERROR: Agent failed with exit code $CLAUDE_EXIT_CODE ==="
fi

log "=== Agent going to sleep ==="
