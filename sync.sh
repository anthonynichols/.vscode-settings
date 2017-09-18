#!/bin/bash

SETTINGS_DIR="$HOME/Library/Application Support/Code/User"

function sync() {
    rsync -avh --progress ./snippets ./keybindings.json ./settings.json "$SETTINGS_DIR"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    sync
else
    read -p "This may overwrite existing files and settings. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sync
    fi
fi

unset SETTINGS_DIR
unset sync