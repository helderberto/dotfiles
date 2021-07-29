source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme.
antigen theme romkatv/powerlevel10k

zstyle ':completion:*' special-dirs true

# Lazy loading NVM scripts
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# here's LS_COLORS
# github.com/trapd00r/LS_COLORS
command -v gdircolors >/dev/null 2>&1 && alias dircolors="gdircolors"
eval "$(dircolors -b ~/.dircolors)"

antigen apply

# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add `~/bin` to the `$PATH`
export PATH="$PATH:/usr/local/bin";
export PATH="/usr/local/sbin:$PATH"
. /usr/local/etc/profile.d/z.sh

# Gruvbox Dark color scheme for fzf
# https://github.com/junegunn/fzf/wiki/Color-schemes#gruvbox-dark
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
