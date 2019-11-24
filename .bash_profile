# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# workspace
export WS="$HOME/Workspace"
alias ws="cd $WS"
alias labs="cd $WS/labs"

# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
