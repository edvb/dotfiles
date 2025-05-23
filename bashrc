# stuff {{{1
# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

if [ -f "/usr/share/git-core/contrib/completion/git-prompt.sh" ] ; then
	source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

#}}}
# prompt statement {{{1
# change color of branch name
git_color() {
	if [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
		local color="${Cyan}"

		# modified
		git diff --no-ext-diff --quiet --exit-code || color="${Red}"

		# staged
		if git rev-parse --quiet --verify HEAD >/dev/null; then
			git diff-index --cached --quiet HEAD -- || color="${IRed}"
		fi

		# stashed
		git rev-parse --verify refs/stash >/dev/null 2>&1 && color="${Yellow}"

		echo "$color"
	fi
}

git_ps1_wrap() {
	if type "__git_ps1" &> /dev/null ; then
		__git_ps1 "$@"
	fi
}

PS1='\[${Blue}\]\u \
\[$(echk_color)\]$(echk_random_face) \
\[$(git_color)\]$(git_ps1_wrap "%s ")\[${Yellow}\]\
$([ \j -gt 0 ] && echo "\j ")\[${White}\]\
\$\[${Color_Off}\] '

# PS1='\[${White}\]\$\[${Color_Off}\] '
# PS1="${Blue}\u@\h${Color_Off}:${Cyan}\w${White}❯❯${Color_Off} "
# PS1='C:${PWD////\\\\}> '

PS2='\[${White}\]\$\[${Color_Off}\] '

PROMPT_COMMAND="[ -d .git -o -f .sett ] && sett"

# basic {{{1
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

# allow for color support in terminal
if [ "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi

export GPG_TTY=$(tty)

# load other files
source ~/bin/ED.sh
source ~/bin/echk
source ~/bin/colors.sh
source ~/bin/z.sh

# add dart's bin to PATH
if [ -d "/usr/lib/dart/bin" ]; then
	PATH="/usr/lib/dart/bin:$PATH"
fi
if [ -d "$HOME/code/dart/flutter/bin" ]; then
	PATH="$HOME/code/dart/flutter/bin:$PATH"
fi

# aliases {{{1
# better tab complete
bind '"\t":menu-complete'

# enable color support
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto -F'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'

	alias diff='diff --color=auto'
fi

# easily change back directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# better ls-ing
alias ll='ls -alFh'
alias la='ls -A'

# make these commands safer
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i'

# shortcuts
alias sb='source ~/.bashrc'
alias cmon='sudo "$BASH" -c "$(history -p !!)"'
alias emacs='emacs --no-window-system'
alias matlab='matlab -nodesktop'
alias old='tg old'
alias gdb='gdb -q'
alias db='gdb -q -ex run ./$(basename $PWD)' # TODO smart script to allow argument
alias v='valgrind --leak-check=full --show-leak-kinds=all'
alias gf='echo haha, you wish'
alias ytdlp='youtube-dl --extract-audio --audio-format mp3 -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"'
alias newline='echo >>'
alias term='tabbed -ck st -w'
alias f='feh --force-aliasing --auto-zoom --auto-rotate --scale-down'
alias py='python3 -q'
alias exif='identify -verbose' # TODO only get exif info
alias todo='grep -RI TODO * --exclude-dir=public' # TODO use git grep if in git repo
alias gg='git grep --untracked'
alias dock-run='docker run -it --rm --detach-keys='ctrl-e,e' -v $PWD:$PWD -w $PWD'
alias fonts-reload='fc-cache -f -v'

#}}}
