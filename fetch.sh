#!/bin/bash

SETTINGS_DIR="$HOME/Library/Application Support/Code/User"

function fetch() {
    rsync -avh --progress "$SETTINGS_DIR/keybindings.json" "$SETTINGS_DIR/snippets" "$SETTINGS_DIR/settings.json" .
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    fetch
else
    read -p "This may overwrite existing files and settings. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        fetch
    fi
fi

unset SETTINGS_DIR
unset fetch