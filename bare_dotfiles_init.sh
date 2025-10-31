#! /usr/bin/bash

# Check if the directory is already a bare git repository
if [ ! -d "$HOME/.dotfiles" ] || [ ! -d "$HOME/.dotfiles/objects" ] || [ ! -d "$HOME/.dotfiles/refs" ]; then
  # If not, initialize the bare git repository
  git init --bare $HOME/.dotfiles/
  echo "Initialized bare git repository in $HOME/.dotfiles/"
else
  echo "Bare git repository already exists at $HOME/.dotfiles/"
fi

alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Configure git to not show untracked files
dotgit config --local status.showUntrackedFiles no

# Add the alias to .bashrc if not already there
if ! grep -q "alias dotgit" $HOME/.bashrc; then
  echo "alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >>$HOME/.bashrc
  echo "Added dotgit alias to .bashrc"
else
  echo "dotgit alias already exists in .bashrc"
fi
