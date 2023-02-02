#!/usr/bin/env bash

set -e

__usage="
Usage:
./install.sh [install|uninstall]
- INSTALL or UNINSTALL dotfiles from this directory
- to your home directory in the default locations
- for bash (~/.bashrc), vim (~/.vimrc), and tmux (~/.tmux.conf)
NOTE: This installation script will abort if:
(1) Previous backup files are found
(2) Links are already present
" 

backup_suffix=".6242.backup"

function usage () {
    echo "$__usage"
    exit
}

function abort () {
    echo "I am uncomfortable proceeding ... aborting"
    exit 1
}

function check_for_previous_installation () {
    local backup_path="$1""$backup_suffix"
    echo "Looking for a backup at $backup_path"
    if [[ -f $backup_path ]]; then
        echo "Found a previous backup file at $backup_path"
        echo Aborting!
        abort
    fi
}

function make_backup () {
    echo Checking for file $1!
    local backup_path="$1""$backup_suffix"
    if [[ -f $1 ]]; then
        if [[ -L $1 ]]; then 
            echo Found a link at $1, not making a backup!
            return
        fi
        echo "Backing up file $1 to $backup_path"
        # mv $1 $backup_path
        echo "$1 backed up!"
    else
        echo Did NOT find file $1!
    fi
}

arg=$(echo $1 | tr '[:upper:]' '[:lower:]')
files=("$HOME/.bashrc" "$HOME/.vimrc" "$HOME/.tmux.conf")

if [[ $arg != install ]] && [[ $arg != uninstall ]]; then
    usage
fi

if [[ $arg == install ]]; then
    echo Found an installation command
    echo Installing!
    for f in ${files[@]}; do
        echo "Checking for previous backups for $f"
        check_for_previous_installation $f
        check_for_dotfile_in_repo $f
    done
fi

if [[ $arg == uninstall ]]; then
    echo Found an un-installation command
    echo Removing file links and restoring backups...
fi


