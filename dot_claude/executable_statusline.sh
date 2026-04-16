#!/usr/bin/env bash
input=$(cat)
ESC=$'\e'

model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
pct_raw=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
win_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')
cost_raw=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
cwd=$(echo "$input" | jq -r '.cwd // "."')
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
  pct_num=0
else
  pct_num="$(printf '%.0f' "$pct_raw")"
  pct="${pct_num}%"
fi

# Git branch
branch=""
if command -v git >/dev/null 2>&1 && [ -n "$cwd" ] && git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null || true)
fi

# Cost
cost=""
if [ -n "$cost_raw" ] && awk "BEGIN { exit !($cost_raw > 0) }" 2>/dev/null; then
  cost=$(printf '$%.2f' "$cost_raw")
fi

# Build URLs from git remote
repo_url=""
repo_name=""
if [ -n "$remote" ]; then
  repo_url=$(echo "$remote" | sed 's|git@\([^:]*\):\(.*\)\.git|https://\1/\2|; s|\.git$||')
  repo_name=$(basename "$repo_url")
fi

# Colors
C="${ESC}[1;36m"  # cyan bold
Y="${ESC}[1;33m"  # yellow bold
G="${ESC}[32m"    # green
RE="${ESC}[31m"   # red
M="${ESC}[35m"    # magenta
D="${ESC}[2m"     # dim
R="${ESC}[0m"     # reset

# Context color: green < 50%, yellow 50-79%, red 80%+
ctx_color="$G"
if [ "$pct_num" -ge 50 ] 2>/dev/null; then ctx_color="$Y"; fi
if [ "$pct_num" -ge 80 ] 2>/dev/null; then ctx_color="$RE"; fi

# OSC 8 link helper: link TEXT URL
link() { echo -n "${ESC}]8;;${2}${ESC}\\${1}${ESC}]8;;${ESC}\\"; }

# Build output
out="${C}${model}${R}"

if [ -n "$repo_name" ]; then
  if [ -n "$repo_url" ]; then
    out="${out} ${D}|${R} ${D}$(link "$repo_name" "$repo_url")${R}"
  else
    out="${out} ${D}|${R} ${D}${repo_name}${R}"
  fi
fi

if [ -n "$branch" ]; then
  out="${out} ${D}|${R} ${M}${branch}${R}"
fi

out="${out} ${D}|${R} ${ctx_color}${tokens} ${pct}${R}"

if [ -n "$cost" ]; then
  out="${out} ${D}|${R} ${Y}${cost}${R}"
fi

echo "$out"
