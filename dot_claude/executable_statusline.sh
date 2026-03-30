#!/usr/bin/env bash
input=$(cat)

raw=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

if [ "$raw" -ge 1000 ]; then
  tokens="$(( raw / 1000 ))K"
else
  tokens="$raw"
fi

YELLOW='\033[1;33m'
WHITE='\033[37m'
RESET='\033[0m'

printf "${YELLOW}%s${RESET}${WHITE}(%s%%)${RESET}\n" "$tokens" "$pct"
