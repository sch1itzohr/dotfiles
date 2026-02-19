#\!/usr/bin/env bash

# Linux (Debian/Ubuntu) equivalent of brew.sh
if [[ "$(uname)" \!= "Linux" ]]; then
  echo "apt.sh is Linux-only."
  exit 1
fi

sudo apt update && sudo apt upgrade -y

# Core utilities
sudo apt install -y \
  build-essential curl wget git git-lfs \
  vim neovim tmux screen \
  zsh autojump \
  tree jq ripgrep \
  gnupg openssh-client \
  python3 python3-pip \
  xclip xsel \
  ghostscript imagemagick \
  p7zip-full pigz zopfli \
  nmap socat \
  lua5.4

# Oh-My-Zsh (run separately or via zsh.sh)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set zsh as default shell
if \! grep -q "$(which zsh)" /etc/shells; then
  echo "$(which zsh)" | sudo tee -a /etc/shells
fi
chsh -s "$(which zsh)"
