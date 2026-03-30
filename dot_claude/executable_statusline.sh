#!/usr/bin/env bash
data=$(cat)

model=$(echo "$data" | jq -r '.model.display_name // .model.id // "unknown"')
ctx=$(echo "$data" | jq -r '(.context_window.used_percentage // 0) | floor')
cwd=$(echo "$data" | jq -r '.cwd // ""')

branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)
remote=$(git -C "$cwd" remote get-url origin 2>/dev/null)

if [[ "$remote" =~ ^git@github\.com:(.+)$ ]]; then
  repo_url="https://github.com/${BASH_REMATCH[1]%.git}"
elif [[ "$remote" =~ ^https://github\.com/(.+)$ ]]; then
  repo_url="https://github.com/${BASH_REMATCH[1]%.git}"
fi

BAR_WIDTH=10
FILLED=$(( ctx * BAR_WIDTH / 100 ))
EMPTY=$(( BAR_WIDTH - FILLED ))
BAR=""
[ "$FILLED" -gt 0 ] && printf -v FILL "%${FILLED}s" && BAR="${FILL// /▓}"
[ "$EMPTY" -gt 0 ] && printf -v PAD "%${EMPTY}s" && BAR="${BAR}${PAD// /░}"

(( ctx >= 80 )) && c="\e[31m" || { (( ctx >= 50 )) && c="\e[33m" || c="\e[32m"; }
link() { printf '\e]8;;%s\e\\%s\e]8;;\e\\' "$1" "$2"; }

printf "\n\e[36m[%s]\e[0m | ${c}%s %s%%\e[0m" "$model" "$BAR" "$ctx"
[[ -n "$repo_url" ]] && printf " | " && link "$repo_url" "$(basename "$repo_url")"
[[ -n "$branch" ]] && printf " | " && link "${repo_url}/tree/${branch}" "$branch"
printf "\n\n"
