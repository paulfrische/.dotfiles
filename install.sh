#!/bin/env bash

set -e

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow -vt $HOME alacritty
stow -vt $HOME git
stow -vt $HOME i3
stow -vt $HOME nvim
stow -vt $HOME emacs
stow -vt $HOME tmux
stow -vt $HOME zsh
stow -vt $HOME scripts
