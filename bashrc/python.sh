# shellcheck shell=bash

# Activate a virtualenv.
# The only argument specifies the suffix to 'venv' in the name of the virtualenv.
function venv () {
    DIR=$PWD
    VENV="venv$1"
    while [[ "$DIR" != "/"  ]]; do
        if [[ -d "$DIR/$VENV" ]]; then
            source "$DIR/$VENV/bin/activate"
            echo "Activated venv at $DIR/$VENV, $(python --version)"
            return 0
        fi
        DIR=$(dirname "$DIR")
    done
    source "$HOME/$VENV/bin/activate" && echo "Activated default $VENV, $(python --version)"
}

# Cleanup python pyc files.
function rmpyc () {
    if [[ ! $1 ]]; then
        local DIR="."
    else
        local DIR=$1
    fi
    find "$DIR" | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -r
}
