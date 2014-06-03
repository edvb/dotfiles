# prompt statement{{{1
cmd_check() {
    if [[ $? = 0 ]]; then
        echo "${Green}:)";
    else
        echo "${Red}:(";
    fi;
}

PS1='\
[${Blue}\u\
 $(cmd_check) ${White}]\
${White}$(__git_ps1 "[${Cyan}%s${White}]")${White}\
\$${Color_Off} \
'

# PS1="\
# ${Cyan}┌─${Cyan}\
# (${BIBlue}\u${Cyan})─\
# (${BIBlue}\h${Cyan})─\
# (${BIBlue}\j${Cyan})
# ${Cyan}└─\
# ${Cyan}($(cmd_check)${Cyan})\
# ${Cyan}❯${Color_Off}❯ \
# "

# PS1="${Blue}\u@\h${Color_Off}:${Cyan}\w${IBlue}❯${Color_Off}❯ "
# PS1='C:${PWD////\\\\}>'

PS2="\$"

# basic{{{1
export EDITOR='vim'

# fortune | cowsay

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

alias vrc='vim ~/.vimrc'
alias vrcb='vim ~/.vimrc.bundles'
alias brc='vim ~/.bashrc'
alias bp='vim ~/dotfiles/bash_profile'
alias tconf='vim ~/dotfiles/tmux.conf'

alias py='python3'
alias py2='python2'
alias ta='tmux attach -t'

alias v='xmodmap ~/.vim_keyboard'

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
