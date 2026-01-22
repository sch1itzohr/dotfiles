#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")";

# Only pull if we're in a git repo with a remote configured
if git rev-parse --git-dir > /dev/null 2>&1 && git remote get-url origin > /dev/null 2>&1; then
	echo "Pulling latest changes from origin/main..."
	git pull origin main;
fi

function doIt() {
	# Check if rsync is available
	if ! command -v rsync &> /dev/null; then
		echo "Error: rsync is not installed. Please install it first."
		exit 1
	fi

	mkdir -p $HOME/.oh-my-zsh/
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "zsh.sh" \
		--exclude "install.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

	# Only source .zshrc if zsh is installed
	if command -v zsh &> /dev/null && [ -f ~/.zshrc ]; then
		source ~/.zshrc;
	else
		echo "Note: zsh not installed or .zshrc not found. Skipping source."
	fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
