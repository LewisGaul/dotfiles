#!/usr/bin/env bash

set -e

THIS_DIR=$(dirname "${BASH_SOURCE[0]}")

for from_filepath in $(find "$THIS_DIR/homedir" -type f); do
    file=$(realpath --relative-to="$THIS_DIR/homedir" "$from_filepath")
    # Remove leading double underscore that indicates it's private to the host.
    file=${file#__}
    to_filepath=$HOME/$file
    if [[ $from_filepath == "$HOME/"* ]]; then
        from_symlink=$(realpath --relative-to="$HOME" "$from_filepath")
    else
        from_symlink=$from_filepath
    fi
    if [[ -e $to_filepath ]]; then
        if diff "$from_filepath" "$to_filepath"; then
            echo "File $file already deployed"
            continue
        fi
        echo "Skipping $file as it already exists, please remove and rerun" >&2
    else
        echo "Symlinking $file"
        ln -s "$from_symlink" "$to_filepath"
    fi
done
