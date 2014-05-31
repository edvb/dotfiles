#!/usr/bin/env bash
# prompt statement{{{1
check="${Green}✓ "
cross="${Red}✗ "
cmd_check="\[\`if [[ \$? = "0" ]]; then echo '$check'; else echo '$cross'; fi\`"

# file_number="\[\`/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //'\`"
# file_number="\[\`ls -1 | wc -l\`"

if [[ "$@" = "cd" ]]; then
    connector="┝";
else
    connector="┌";
fi

PS1="${Cyan}${connector}─${Cyan}\
(${BIBlue}\u${Cyan})─\
(${BIBlue}\h${Cyan})─\
(${BIBlue}\j${Cyan})
${Cyan}└─\
${Cyan}(${cmd_check}${Cyan})\
${Cyan}❯${Color_Off}❯ "

# PS1="${Blue}\u@\h${Color_Off}:${Cyan}\w${IBlue}❯${Color_Off}❯ "
# PS1="${Blue}\$${Color_Off} "
# PS1="${BGreen}\u@\h${Color_Off}:${BBlue}\w${Color_Off}\$ "

# (${BIBlue}$(file_number), $(file_size)${Cyan})-\
PS2="    ${Cyan}❯${Color_Off} "

# basic{{{1
export EDITOR='vim'

fortune | cowsay

# alias stuff{{{1
bind '"\t":menu-complete'
alias sb='source ~/.bashrc'
alias ..='cd ..'

alias c='clear'
alias r='reset'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i'

alias py='python3'
alias py2='python2'

alias vrc='vim ~/.vimrc'
alias vrcb='vim ~/.vimrc.bundles'
alias brc='vim ~/.bashrc'
alias bp='vim ~/dotfiles/bash_profile'
alias tconf='vim ~/dotfiles/tmux.conf'

alias v='xmodmap ~/.vim_keyboard'

cd() {
    builtin cd "$@"
    echo -e "${Cyan}┌${Color_Off}(${BBlack}"`pwd`"${Color_Off})"
}

# function stuff{{{1
function ipls
{
    ifconfig | grep 'inet addr:' | awk {'print $2'}
}

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
    fi
if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    fi
#}}}
