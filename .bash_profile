# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell


# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export DISPLAY=:0.0
export MANPATH=/opt/local/man:$MANPATH

# node.js
source ~/.nvm/nvm.sh
nvm use v0.8.22
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir
