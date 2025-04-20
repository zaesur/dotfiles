#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
	mkdir -p "$HOME/.config"
fi

CURRENT_DIR="$(pwd)"
ln -s -f "$CURRENT_DIR/nvim" "$HOME/.config/nvim"
ln -s -f "$CURRENT_DIR/bashrc" "$HOME/.bashrc"
