# prompt statement{{{1
random_happy_ned() {
    local faces=(":)" ":D" ":)" ":D" ":)" ":D" ":)")
    local l=${#faces[*]}
    local sym=${faces[$(($RANDOM % $l))]}
    echo $sym
}

random_sad_ned() {
    local faces=(":P" ":(" ":(" ":O" ":\\" ":|" ":(" ":(")
    local l=${#faces[*]}
    local sym=${faces[$(($RANDOM % $l))]}
    echo $sym
}

cmd_check() {
    if [[ $? = 0 ]]; then
        echo "${Green}$(random_happy_ned)";
    else
        echo "${Red}$(random_sad_ned)";
    fi;
}

# PS1='\
# [${Blue}\u\
#  $(cmd_check) ${White}]\
# ${White}$(__git_ps1 "[${Cyan}%s${White}]")${White}\
# \$${Color_Off} \
# '

PS1='\
${Blue}\u\
 $(cmd_check) \
$(__git_ps1 "${Cyan}%s ")${White}\
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
alias r='reset'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -i'

alias vrc='vim ~/dotfiles/vimrc'
alias vrcb='vim ~/dotfiles/vimrc.bundles'
alias brc='vim ~/dotfiles/bashrc'
alias bp='vim ~/dotfiles/bash_profile'
alias tconf='vim ~/dotfiles/tmux.conf'

alias v='xmodmap ~/.vim-keys.xmodmap'
alias emacs='emacs -nw'
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'

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
