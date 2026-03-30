#!/usr/bin/env bash
input=$(cat)

tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

YELLOW='\033[1;33m'
WHITE='\033[37m'
RESET='\033[0m'

printf "${YELLOW}%s${RESET}${WHITE}(%s%%)${RESET}\n" "$tokens" "$pct"
