source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
export TERM="xterm-256color"

# Plugins
antigen bundle git
antigen bundle brew
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME=''
antigen theme romkatv/powerlevel10k

source $ZSH/oh-my-zsh.sh

# Editor
export EDITOR='nvim'

zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

# Load defaults
source ~/.bash_profile

antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
