#!/bin/bash

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

# Function to install zsh and dependencies on Ubuntu
install_ubuntu() {
    echo "Installing ZSH and dependencies on Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y zsh curl git
}

# Function to install zsh and dependencies on macOS
install_macos() {
    echo "Installing ZSH and dependencies on macOS..."
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install zsh
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Function to set zsh as default shell
set_default_shell() {
    echo "Setting ZSH as default shell..."
    chsh -s $(which zsh)
}

# Main installation process
main() {
    OS=$(detect_os)
    
    case $OS in
        "ubuntu")
            install_ubuntu
            ;;
        "macos")
            install_macos
            ;;
        *)
            echo "Unsupported operating system"
            exit 1
            ;;
    esac
    
    # Install Oh My Zsh
    install_oh_my_zsh
    
    # Set ZSH as default shell
    set_default_shell
    
    echo "Installation complete! Please restart your terminal."
    echo "You may need to log out and log back in for the shell change to take effect."
}

# Run the script
main

# Install the rest
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
