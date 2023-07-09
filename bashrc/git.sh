# shellcheck shell=bash

alias gbranchclean="git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d"
