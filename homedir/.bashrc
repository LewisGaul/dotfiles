# shellcheck shell=bash

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

for file in /etc/bashrc /etc/bash.bashrc /etc/profile.d/bash_completion.sh; do
    if [[ -f $file ]]; then
        source "$file"
    fi
done

#-------------------------------------------------------------
# General exports
#-------------------------------------------------------------

# What to use to page through long output
export PAGER=less

# Pass some default options to less
# -M Long prompt (total number of lines etc…)
# -W highlights the first new line after any forward movement command longer
#    than 1 line
# -R Display raw excape chars (i.e. preserve colour formatting)
export LESS='-M-W-R'
# Make less able to read zipped files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Default editor - controls what many commands use when they need a text editor.
export EDITOR=nano
export VISUAL=$EDITOR

# Location for screen to use
export SCREENDIR="$HOME/.screen"

# XServer
export DISPLAY=":0"

# Locale
export LC_ALL=C


#-------------------------------------------------------------
# History
#-------------------------------------------------------------

export HISTSIZE=100000
HISTFILESIZE=10000

# Don't store whitespace or commands that are the same as the previous one.
export HISTCONTROL=ignoredups:ignorespace

# A list of commands to avoid storing in the history
export HISTIGNORE="exit:x:clear:cls"

# Display the date and time commands were entered in the history
export HISTTIMEFORMAT="%F %T "

# Append to the history file, don't overwrite it
shopt -s histappend


#-------------------------------------------------------------
# Misc options
#-------------------------------------------------------------

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

shopt -s nullglob

#-------------------------------------------------------------
# Include other files
#-------------------------------------------------------------

for file in "$(dirname "$(realpath "${BASH_SOURCE[0]}")")"/../bashrc/*.sh; do
    source "$file"
done

# Set up PATH
for path in \
    /bin \
    /sbin \
    /usr/bin \
    /usr/sbin \
    /usr/local/bin \
    /usr/local/sbin \
    ~/.local/bin \
    ~/bin
do
    pathmunge "$path"
done
