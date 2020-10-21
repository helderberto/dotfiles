source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Plugins
antigen bundle mengelbrecht/slimline

# Theme
export SLIMLINE_PROMPT_VERSION=1 # Activate legacy option format

zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 && alias dircolors="gdircolors"
eval "$(dircolors -b ~/.dircolors)"

if [ -z "$TMUX" ]
then
  tmux attach -t "default" || tmux new -s "default"
fi

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

antigen apply
