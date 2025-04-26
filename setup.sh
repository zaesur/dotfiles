#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
	mkdir -p "$HOME/.config"
fi

CURRENT_DIR="$(pwd)"
ln -s -f "$CURRENT_DIR/nvim" "$HOME/.config"
ln -s -f "$CURRENT_DIR/bashrc" "$HOME/.bashrc"
ln -s -f "$CURRENT_DIR/zshrc" "$HOME/.zshrc"
