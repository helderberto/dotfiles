source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
export TERM="xterm-256color"

# Plugins
antigen bundle git
antigen bundle brew
antigen bundle command-not-found
# antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle mengelbrecht/slimline

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Theme
export SLIMLINE_PROMPT_VERSION=1 # Activate legacy option format

# Editor
export EDITOR='nvim'

zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

# Load defaults
source ~/.bash_profile

antigen apply

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
