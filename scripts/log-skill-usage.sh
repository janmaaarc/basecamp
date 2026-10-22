#!/usr/bin/env bash
# Logs each Skill call and typed /command so never-used skills can be turned off with skillOverrides; always exits 0.

set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0

LOG="$HOME/.claude/state/skill-usage.tsv"
INPUT=$(cat)

# The trailing space-or-end requirement stops a prompt that opens with a path like /Users/x from logging "Users".
SKILL=$(printf '%s' "$INPUT" | jq -r '
  if .tool_name == "Skill" then .tool_input.skill // empty
  elif (.prompt // "") | test("^/[A-Za-z0-9:_-]+(\\s|$)") then (.prompt | capture("^/(?<s>[A-Za-z0-9:_-]+)").s)
  else empty end | gsub("[[:cntrl:]]"; " ")' 2>/dev/null)
[ -n "$SKILL" ] || exit 0

SOURCE=$(printf '%s' "$INPUT" | jq -r 'if .tool_name == "Skill" then "model" else "user" end')
PROJECT=$(basename "$(printf '%s' "$INPUT" | jq -r '.cwd // empty')")

mkdir -p "$(dirname "$LOG")"
printf '%s\t%s\t%s\t%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$SKILL" "$SOURCE" "$PROJECT" >> "$LOG"
exit 0
