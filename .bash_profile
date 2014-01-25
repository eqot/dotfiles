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

# Maltybrew
. $HOME/bin/maltybrew switch_inplace dev

# node.js
source ~/.nvm/nvm.sh
nvm use v0.10.24
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm use 2.0.0@rails_4_0_2 --default
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Android
PATH=$PATH:$HOME/bin/Android/adt/sdk/platform-tools

# git
source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
