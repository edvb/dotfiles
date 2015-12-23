# basic {{{1
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

# history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# completion stuf
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/ed/.zshrc'
autoload -Uz compinit
compinit

# load files
source ~/bin/ED.sh
source ~/bin/checkium.sh
source ~/bin/colors.sh
source ~/bin/git-prompt.sh
source ~/bin/z.sh

# prompt statement {{{1
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

# PS1="%{$Blue%}%M \
# $(checkium_color)$(checkium_random_face) \
# $(git_color)$(__git_ps1 "%s ")%{$Yellow%}\
# $([ $(jobs | wc -l) -gt 0 ] && echo "%j ")%{$White%}\
# \$%{$Color_Off%} "

PS1="%{$White%}\$%{$Color_Off%} "

PS2="%{$White%}\$%{$Color_Off%} "
