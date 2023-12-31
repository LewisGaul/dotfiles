# shellcheck shell=bash

# Set the format of and the information contained in your prompt using the
# following values separated by your choice of punctuation etc. It is 
# traditional, but by no means universal to end with a '$ '
#       \u = username
#       \h = hostname
#       \t = time
#       \w = working directory (full path)
#       \W = working directory (current directory only)
#       $(__git_ps1 'GIT(%s):') = Information about the git repo
#          NB: this function might not be present
#       \[...\] = All non-printable characters should be surrounded in these
#                 braces so that bash gets the linewrapping correct
#       \e]0;window-title\a = This sequence sets the window title to window-title
#                             and doesn't affect the CLI prompt
#
# Colours can be changed using the values defined, e.g.
#       \[$RED\]<text>\[$NC\]
#
# Examples:
# if declare -F __git_ps1 > /dev/null; then
#     # The git function is present so use it to add git info to the prompt
#     # 1. [user@server GIT:(<branch name>) directory]$ (also set the window title to 'user@host')
#     PS1="\[\e]0;\u@\h\a$LIGHT_RED\][\u@\h\[$LIGHT_GREEN\]\$(__git_ps1 ' GIT(%s)')\[$LIGHT_RED\] \W]\$ \[$NC\]"
# else
#     # No git function, so don't use that in the prompt
#     # 2. [user@server directory]$
#     PS1="\[\e]0;\u@\h\a\][\u@\h \W]\$ "
# fi
#
# Just the server you are working on:
#PS1="\h$ "
#
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


function make_prompt () {
    local exit_status=$? exit_colour
    local git_branch venv

    if [[ $exit_status == 0 ]]; then
        local exit_colour=$WHITE
    else
        local exit_colour=$RED
    fi

    if [[ $VIRTUAL_ENV && ! "${VIRTUAL_ENV_DISABLE_PROMPT:-}" ]]; then
        venv="($(basename "$VIRTUAL_ENV")) "
    fi

    git_branch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [[ $git_branch ]]; then
        git_branch="($git_branch)"
    fi

    export PS1="$venv\[$DARK_RED\]\t\[$NC\] \[$GREEN\]\h\[$NC\]:\[$LIGHT_BLUE\]\W/\[$NC\]\[$BROWN\]$git_branch\[$NC\]\[$exit_colour\]\$\[$NC\]"
}

PROMPT_COMMAND=make_prompt
export PS2=">"
