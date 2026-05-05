#!/usr/bin/env bash
# PreToolUse Bash hook.
# Blocks `git commit` on the `main` branch when the staged changes touch
# task-related paths (HOOK_RE_TASK_PATHS in config.env).
#
# Governance-style files within those paths are exempt
# (HOOK_RE_GOVERNANCE_BASENAME — basename CLAUDE.md or HOWTO-*.md) as
# convention documents whose edits are legitimate housekeeping-on-main
# (per root CLAUDE.md Block 1's "Housekeeping changes ... governance
# files" rule).  Only when a task-path change exists that is NOT
# governance-style does the hook block.
#
# Housekeeping commits touching only root-level files (TODO.md, root
# CLAUDE.md, Makefile, etc.) never match the task-path regex to begin
# with, so they pass unchanged.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck disable=SC1091
source "$DIR/config.env"

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r .tool_input.command)

case "$CMD" in
    *"git commit"*) ;;
    *)              exit 0 ;;
esac

BRANCH=$(git branch --show-current 2>/dev/null || true)
[ "$BRANCH" = "main" ] || exit 0

NON_GOVERNANCE=$(
    git diff --cached --name-only 2>/dev/null \
        | grep -E "$HOOK_RE_TASK_PATHS" \
        | grep -vE "$HOOK_RE_GOVERNANCE_BASENAME" \
        || true
)

if [ -n "$NON_GOVERNANCE" ]; then
    echo "BLOCKED: Task-related commit on main — switch to a task branch first." >&2
    exit 2
fi

exit 0
