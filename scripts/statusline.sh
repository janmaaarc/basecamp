#!/usr/bin/env bash
# Status line: Ponytail and Caveman badges plus 5-hour and 7-day usage and effort level, each shown only when available.

command -v jq >/dev/null 2>&1 || exit 0
input=$(cat)
# Match by plugin name, not a hardcoded marketplace or version, so updates and other marketplaces still resolve.
root() { jq -r --arg k "$1" '[.plugins // {} | to_entries[] | select(.key | startswith($k + "@")) | .value[0].installPath] | first // empty' "$HOME/.claude/plugins/installed_plugins.json" 2>/dev/null; }
badge() { [ -n "$1" ] && [ -f "$1/$2" ] && printf '%s' "$input" | bash "$1/$2" 2>/dev/null; }
pony=$(badge "$(root ponytail)" hooks/ponytail-statusline.sh)
cave=$(badge "$(root caveman)" src/hooks/caveman-statusline.sh)
usage=$(printf '%s' "$input" | jq -r '[
  (.rate_limits.five_hour.used_percentage // empty | "5h \(tostring | split(".")[0])%"),
  (.rate_limits.seven_day.used_percentage // empty | "7d \(tostring | split(".")[0])%"),
  (.effort.level // empty)
] | join(" ")' 2>/dev/null)
printf '%s %s %s' "$pony" "$cave" "$usage" | tr -s ' ' | sed 's/^ //; s/ $//'
