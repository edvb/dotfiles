# stuff{{{1
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#}}}
# prompt statement{{{1
# change color of branch name
git_color() {
    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
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

PS1='\[${Blue}\]\u \
\[$(checkium_color)\]$(checkium_random_face) \
\[$(git_color)\]$(__git_ps1 "%s ")\[${White}\]\
\$\[${Color_Off}\] '

# PS1="${Blue}\u@\h${Color_Off}:${Cyan}\w${White}❯❯${Color_Off} "
# PS1='C:${PWD////\\\\}>'

PS2='\[${White}\]\$\[${Color_Off}\] '

# basic{{{1
export EDITOR='vim'
# export EDITOR='emacs'

export gh='https://github.com'

# allow for color support in terminal
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# update TMUX if ssh'ed into computer in TMUX
# [[ -z "$TMUX" ]] && exec tmux -2

# load other files
source ~/dotfiles/bin/edium.sh
source ~/dotfiles/bin/checkium.sh
source ~/dotfiles/bin/colors.sh
source ~/dotfiles/bin/git-prompt.sh
source ~/dotfiles/bin/z.sh
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# alias stuff{{{1
# better tab complete
bind '"\t":menu-complete'

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -F'
    alias grep='grep --color=auto'
fi

# easily change back directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# better ls-ing
alias ll='ls -alF'
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
alias t='todoium'

# mkdir and cd in one command
mkcd () {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1"
}

#}}}
