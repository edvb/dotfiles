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
# colors{{{
Color_Off=$'\033[m'
Red=$'\033[0;31m'
Green=$'\033[0;32m'
Blue=$'\033[0;34m'
Cyan=$'\033[0;36m'
White=$'\033[0;37m'
#}}}
# prompt statement{{{1
random_happy_face() {
    local faces=(":)" ":D" ":)" ":D" ":)" ":D" ":)")
    local l=${#faces[*]}
    local sym=${faces[$(($RANDOM % $l))]}
    echo $sym
}

random_sad_face() {
    local faces=(":P" ":(" ":(" ":O" ":\\" ":|" ":(" ":(")
    local l=${#faces[*]}
    local sym=${faces[$(($RANDOM % $l))]}
    echo $sym
}

cmd_check() {
    if [[ $? = 0 ]]; then
        echo "${Green}$(random_happy_face)";
    else
        echo "${Red}$(random_sad_face)";
    fi;
}

PS1='\
${Blue}\u\
 $(cmd_check) \
$(__git_ps1 "${Cyan}%s ")${White}\
\$${Color_Off} \
'

# PS1="${Blue}\u@\h${Color_Off}:${Cyan}\w${White}❯❯${Color_Off} "
# PS1='C:${PWD////\\\\}>'

PS2="\$"

# basic{{{1
export EDITOR='vim'
# export EDITOR='emacs'

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# load other files
source ~/dotfiles/bin/git-prompt.sh
source ~/dotfiles/bin/z.sh
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi

# fortune | cowsay

# alias stuff{{{1
# better tab complete
bind '"\t":menu-complete'

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# shortcuts
alias sb='source ~/.bashrc'
alias r='reset'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# better ls-ing
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# make these commands safer
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i'

# other
alias v='xmodmap ~/.vim-keys.xmodmap'
alias emacs='emacs -nw'
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias t='todoium'

ipls () {
    ifconfig | grep 'inet addr:' | awk {'print $2'}
}

mkcd () {
    [ -n "$1" ] && mkdir -p "$@" && cd "$1"
}

#}}}
