# shellcheck shell=bash

alias slist='screen -list'
alias swipe='screen -wipe'

function sconn () {
    screen -D -R "$1"
}

function squit () {
    screen -S "$1" -X quit
}

function sopen () {
    screen -S "$1" -X select .
}

function sname () {
    screen -S "$1" -X sessionname "$2"
}

function scone () {
    # If screen already exists then just connect to it.
    if sopen "$1"; then
        sconn "$1" && return 0
    fi

    # Create the screen session and tabs.
    screen -dmS "$1"
    screen -S "$1" -X screen -t python 1
    screen -S "$1" -X screen -t git 2
    screen -S "$1" -X screen -t test 3
    screen -S "$1" -X screen -t idle 4

    # Do some initial stuff in the tabs.
    screen -S "$1" -p 1 -X stuff ' venv; ipython ^M'
    screen -S "$1" -p 2 -X stuff ' venv; git status ^M'
    screen -S "$1" -p 3 -X stuff ' venv ^M'
    screen -S "$1" -p 4 -X stuff ' venv ^M'

    # Connect the screen.
    screen -x "$1" -p 2
}
