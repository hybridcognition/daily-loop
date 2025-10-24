#!/bin/bash

# Daily Loop GitHub Issue Poller
# Checks for open GitHub issues every 5 minutes
# If found, calls wake-up.sh to trigger the agent

WORK_DIR=~/daily-loop
REPO_OWNER="hybridcognition"
REPO_NAME="daily-loop"
LOG_FILE="$WORK_DIR/logs/poll-and-wake.log"

# Create logs directory if it doesn't exist
mkdir -p "$WORK_DIR/logs"

# Timestamp function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Check for open issues
OPEN_COUNT=$(gh issue list --repo "$REPO_OWNER/$REPO_NAME" --state open --json number 2>/dev/null | jq '. | length')

# If any open issues, wake the agent
if [ "$OPEN_COUNT" -gt 0 ]; then
    log "Found $OPEN_COUNT open issue(s) - waking agent"
    bash "$WORK_DIR/wake-up.sh"
else
    log "No open issues - staying dormant"
fi
