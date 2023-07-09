# Personal Bash Dotfiles

## How To Use

Intended use is to clone the repo somewhere, e.g. `~/lib/`, and then run the `setup.sh` script.

Set `DOTFILES_FORCE_OVERWRITE=1` when running `setup.sh` to allow overwriting existing files in the home dir.

Example:
```
$ git clone https://github.com/LewisGaul/dotfiles.git ~/lib/dotfiles/
Cloning into '/home/legaul/lib/dotfiles'...
remote: Enumerating objects: 41, done.
remote: Counting objects: 100% (41/41), done.
remote: Compressing objects: 100% (28/28), done.
remote: Total 41 (delta 11), reused 38 (delta 11), pack-reused 0
Unpacking objects: 100% (41/41), 15.47 KiB | 73.00 KiB/s, done.

$ ~/lib/dotfiles/setup.sh
Skipping .bashrc - already exists, please remove and rerun
Symlinking .gitconfig
Symlinking .gitignore_global
Skipping .inputrc - already exists, please remove and rerun
Symlinking .lessfilter
Symlinking .screenrc
Symlinking .vimrc

$rm ~/.inputrc ~/.bashrc

$~/lib/dotfiles/setup.sh
Symlinking .bashrc
File .gitconfig already deployed
File .gitignore_global already deployed
Symlinking .inputrc
File .lessfilter already deployed
File .screenrc already deployed
File .vimrc already deployed

$source ~/.bashrc

18:55:40 myhost:~/$
```

## Repo Structure

- `setup.sh`: Script to set up the home dir symlinks.
- `homedir/`: Files that get symlinked from the home dir.
- `bashrc/`: Modules that are included from `.bashrc`.

Any files prefixed with a double underscore will be ignored by git, but will still be picked up (e.g. `setup.sh` will remove the prefix when creating the symlink).
This allows for easy management of host-specific files.
