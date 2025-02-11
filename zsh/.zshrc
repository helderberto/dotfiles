# Enable Powerlevel10k instant prompt (keep this at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Performance optimizations
# Compile zcompdump if modified, to increase startup speed
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
  touch ~/.zcompdump
else
  compinit -C
fi

# Cache expensive completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

### Antigen configuration
source $(brew --prefix)/share/antigen/antigen.zsh

# Load oh-my-zsh library
antigen use oh-my-zsh

# Bundle configuration (grouped by functionality)
# Completion and syntax
antigen bundles <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
EOBUNDLES

# Theme configuration
antigen theme romkatv/powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Apply antigen changes
antigen apply

### Completion configuration
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion

### Directory colors
command -v gdircolors >/dev/null 2>&1 && alias dircolors="gdircolors"
[[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)"

### Source additional configuration files
# Load custom configurations
for config_file in ~/.{extra,exports,aliases,functions}; do
    [[ -r "$config_file" ]] && source "$config_file"
done
unset config_file

### FZF configuration
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Catppuccin Mocha theme for FZF
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

### Key bindings
bindkey '\t\t' autosuggest-accept # Double tab for suggestions
bindkey '^[[A' history-substring-search-up     # Up arrow
bindkey '^[[B' history-substring-search-down   # Down arrow

### Path configuration
# Homebrew configuration
export HOMEBREW_PREFIX=$(brew --prefix)
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
export HOMEBREW_SHELLENV_PREFIX="$HOMEBREW_PREFIX"
export ASDF_DATA_DIR="$HOMEBREW_PREFIX/opt/asdf"

# Path configuration (consolidated)
path=(
  "$HOMEBREW_PREFIX/bin"
  "$HOMEBREW_PREFIX/sbin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "$HOME/.codeium/windsurf/bin"
  "$ASDF_DATA_DIR/shims"
  $path
)
export PATH

# Man path
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

### Tool configurations
# Z jump configuration
. $HOMEBREW_PREFIX/etc/profile.d/z.sh

# AWS configuration
export AWS_OKTA_MFA_DUO_DEVICE=token

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

