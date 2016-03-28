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

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ruby
if [ -e "$HOME/.rvm/scripts/rvm" ]; then
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	rvm use 2.2.2@rails_4_2_2 --default
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# Android
android_dir=$HOME/bin/android/android-sdk-mac_x86
PATH=$PATH:$android_dir/platform-tools:$android_dir/tools

# git
#  ref) https://github.com/git/git/tree/master/contrib/completion
if [ -e ~/bin/git-completion.bash ]; then
	source ~/bin/git-completion.bash
fi

if [ -e ~/bin/git-flow-completion.bash ]; then
	source ~/bin/git-flow-completion.bash
fi

if [ -e ~/bin/git-prompt.sh ]; then
	source ~/bin/git-prompt.sh
	PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'
fi

# vert.x, groovy, etc
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
