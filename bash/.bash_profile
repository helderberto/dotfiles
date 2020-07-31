# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$(yarn global bin):$HOME/.emacs.d/bin:$PATH";

# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# NVM
lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}
