# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$(yarn global bin):$PATH";

# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# vim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# workspace
export WS="$HOME/Workspace"
alias ws="cd $WS"
alias labs="cd $WS/labs"

# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
