#!/usr/bin/env bash
input=$(cat)
ESC=$'\e'

model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
pct_raw=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
win_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')
cwd=$(echo "$input" | jq -r '.cwd // "."')
branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)
remote=$(git -C "$cwd" remote get-url origin 2>/dev/null)

# Derive token count from percentage and window size
if [ -n "$pct_raw" ] && [ -n "$win_size" ]; then
  raw=$(echo "$pct_raw $win_size" | awk '{printf "%.0f", $1 * $2 / 100}')
else
  raw=0
fi

if [ "$raw" -ge 1000 ]; then
  tokens="$(( (raw + 500) / 1000 ))K"
else
  tokens="$raw"
fi

# Format percentage
if [ -z "$pct_raw" ]; then
  pct="—"
else
  pct="$(printf '%.0f' "$pct_raw")%"
fi

# Build URLs from git remote
repo_url=""
branch_url=""
repo_name=""
if [ -n "$remote" ]; then
  repo_url=$(echo "$remote" | sed 's|git@\([^:]*\):\(.*\)\.git|https://\1/\2|; s|\.git$||')
  repo_name=$(basename "$repo_url")
  [ -n "$branch" ] && branch_url="${repo_url}/tree/${branch}"
fi

# Colors
C="${ESC}[1;36m"  # cyan bold
Y="${ESC}[1;33m"  # yellow bold
D="${ESC}[2m"     # dim
R="${ESC}[0m"     # reset

# OSC 8 link helper: link TEXT URL
link() { echo -n "${ESC}]8;;${2}${ESC}\\${1}${ESC}]8;;${ESC}\\"; }

# Build output: Model | Count % | project | branch
out="${C}${model}${R} ${D}|${R} ${Y}${tokens} ${pct}${R}"

if [ -n "$repo_name" ]; then
  if [ -n "$repo_url" ]; then
    out="${out} ${D}|${R} ${D}$(link "$repo_name" "$repo_url")${R}"
  else
    out="${out} ${D}|${R} ${D}${repo_name}${R}"
  fi
fi

if [ -n "$branch" ]; then
  if [ -n "$branch_url" ]; then
    out="${out} ${D}|${R} ${D}$(link "$branch" "$branch_url")${R}"
  else
    out="${out} ${D}|${R} ${D}${branch}${R}"
  fi
fi

echo "$out"
