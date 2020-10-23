# Add `~/bin` to the `$PATH`
export PATH="$PATH:/usr/local/bin";
export PATH="$HOME/bin:$(yarn global bin):$HOME/.emacs.d/bin:$PATH";
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
. /usr/local/etc/profile.d/z.sh

# NVM Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
