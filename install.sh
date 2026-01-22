#!/usr/bin/env bash

set -e

echo "=========================================="
echo "  Dotfiles Installation Script"
echo "=========================================="
echo ""

# Function to detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ -f /etc/lsb-release ]]; then
        echo "ubuntu"
    else
        echo "unsupported"
    fi
}

OS=$(detect_os)
echo "Detected OS: $OS"
echo ""

# Step 1: Install zsh and Oh My Zsh
echo "=========================================="
echo "Step 1/4: Installing zsh and Oh My Zsh"
echo "=========================================="
if [ -f "./zsh.sh" ]; then
    chmod +x ./zsh.sh
    ./zsh.sh
else
    echo "Warning: zsh.sh not found, skipping..."
fi
echo ""

# Step 2: Install Homebrew packages (macOS only)
if [[ "$OS" == "macos" ]]; then
    echo "=========================================="
    echo "Step 2/4: Installing Homebrew packages"
    echo "=========================================="
    if [ -f "./brew.sh" ]; then
        chmod +x ./brew.sh
        ./brew.sh
    else
        echo "Warning: brew.sh not found, skipping..."
    fi
else
    echo "=========================================="
    echo "Step 2/4: Skipping Homebrew (not macOS)"
    echo "=========================================="
fi
echo ""

# Step 3: Install Neovim configuration
echo "=========================================="
echo "Step 3/4: Installing Neovim configuration"
echo "=========================================="
NVIM_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Neovim config already exists at $NVIM_CONFIG_DIR"
    echo "Skipping nvim installation."
else
    echo "Cloning kickstart.nvim..."
    git clone https://github.com/nvim-lua/kickstart.nvim.git "$NVIM_CONFIG_DIR"
    echo "Neovim configuration installed!"
fi
echo ""

# Step 4: Copy dotfiles
echo "=========================================="
echo "Step 4/4: Copying dotfiles to home directory"
echo "=========================================="
if [ -f "./bootstrap.sh" ]; then
    chmod +x ./bootstrap.sh
    ./bootstrap.sh
else
    echo "Warning: bootstrap.sh not found, skipping..."
fi
echo ""

echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: exec zsh"
echo "2. Run 'nvim' - it will install plugins on first launch"
echo "3. Configure local settings in ~/.zshrc_local"
echo "4. Configure git user in ~/.gitconfig_local:"
echo "   [user]"
echo "       name = Your Name"
echo "       email = your.email@example.com"
echo ""
echo "Enjoy your new setup!"
