# shellcheck shell=bash

# Variants of 'ls'
alias ls="ls -F --color=auto --group-directories-first --file-type"
alias ll="ls -lAh"
alias la="ls -a"

alias x=exit
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'

# Source bashrc after making a change.
alias src="source ~/.bashrc"

alias cls=clear
alias location='echo $HOSTNAME:$(pwd)'


function cdls () {
    cd "$1" && la
}

function mkcd () {
    mkdir "$1"; cd "$1"
}

# Check definition of a function.
function func () {
    type -a "$1"
}

pathmunge () {
    local varname=$2
    varname=${varname:=PATH}
    if [[ ! ${!varname} ]]; then
        export "$varname=$1";
    else
        if [[ ":${!varname}:" != *":$1:"* ]]; then
            export "$varname=$1:${!varname};"
        fi;
    fi
}


#-------------------------------------------------------------
# Colours
#-------------------------------------------------------------

# These can be used in your prompt or in other bash commands. e.g. the 
# following will output a line in red. Remember to reset at the end.
# echo -e "$RED<text>$NC"
export BLACK="\e[0;30m"
export DARK_GREY="\e[1;30m"
export LIGHT_GREY="\e[0;37m"
export DARK_BLUE="\e[0;34m"
export BLUE="\e[1;34m"
export LIGHT_BLUE="\033[38;5;27m"
export GREEN="\e[0;32m"
export LIGHT_GREEN="\e[1;32m"
export CYAN="\e[0;36m"
export LIGHT_CYAN="\e[1;36m"
export DARK_RED="\e[0;31m"
export RED="\e[1;31m"
export DARK_PURPLE="\e[0;35m"
export PURPLE="\e[1;35m"
export BROWN="\e[0;33m"
export YELLOW="\e[1;33m"
export WHITE="\e[1;37m"
export NC="\e[00m"
# Background
export On_Black='\e[40m'
export On_Red='\e[41m'
export On_Green='\e[42m'
export On_Yellow='\e[43m'
export On_Blue='\e[44m'
export On_Purple='\e[45m'
export On_Cyan='\e[46m'
export On_White='\e[47m'

export LS_COLORS=$LS_COLORS':di=1;36:st=1;36:ow=1;36'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
