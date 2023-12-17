#!/bin/env bash

set -e


stow -vt $HOME alacritty
stow -vt $HOME i3
stow -vt $HOME launchme
stow -vt $HOME emacs
stow -vt $HOME tmux
stow -vt $HOME zsh
stow -vt $HOME scripts
stow -vt $HOME home-manager

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
