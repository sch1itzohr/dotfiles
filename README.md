# Dotfiles

My personal dotfiles for setting up a new macOS or Ubuntu machine.

## Features

- Shell configuration (zsh with Oh My Zsh)
- Git configuration and aliases
- Homebrew package installations
- macOS defaults and preferences
- Terminal configurations (Kitty, iTerm2, Ghostty, etc.)
- Editor configurations (Neovim, Vim)

## Prerequisites

- macOS or Ubuntu
- Git
- Internet connection

## Quick Installation

For a fresh machine, run:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This will:
1. Install zsh and Oh My Zsh
2. Install Homebrew and common packages (macOS only)
3. Install Neovim configuration (kickstart.nvim)
4. Copy dotfiles to your home directory

## Manual Installation

If you prefer to install components individually:

### 1. Install zsh and Oh My Zsh

```bash
./zsh.sh
```

This installs zsh, Oh My Zsh, and useful plugins:
- zsh-syntax-highlighting
- zsh-autosuggestions
- zsh-autocomplete
- Spaceship prompt theme

### 2. Install Homebrew packages (macOS only)

```bash
./brew.sh
```

This installs:
- Core utilities (coreutils, findutils, gnu-sed, etc.)
- Development tools (git, neovim, tmux, etc.)
- Security/CTF tools (nmap, john, hydra, etc.)
- Other useful binaries

### 3. Copy dotfiles to home directory

```bash
./bootstrap.sh
```

Or to skip confirmation:

```bash
./bootstrap.sh --force
```

This copies all dotfiles to your home directory, excluding git-related files.

## Customization

### Local overrides

- `.zshrc_local` - Local zsh configuration (not tracked in git)
- `.gitconfig_local` - Local git configuration (not tracked in git)

Create these files in your home directory for machine-specific settings.

### Example `.gitconfig_local`

```gitconfig
[user]
    name = Your Name
    email = your.email@example.com
```

## What's Included

### Shell Configuration
- `.zshrc` - Zsh configuration
- `.zshenv` - Zsh environment variables
- `.bash_prompt` - Bash prompt configuration
- `.aliases` - Shell aliases
- `.functions` - Useful shell functions
- `.exports` - Environment variables

### Git Configuration
- `.gitconfig` - Git configuration and aliases
- `.gitignore` - Global gitignore

### Editor Configuration
- `.vimrc` - Vim configuration
- `.gvimrc` - GVim configuration
- `.editorconfig` - EditorConfig settings
- `.config/nvim/` - Neovim configuration (kickstart.nvim - installed separately, not tracked in repo)

**Note:** Neovim configuration uses [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and is automatically cloned during installation. Customize your setup in `~/.config/nvim/lua/custom/plugins/`.

### Other Tools
- `.tmux.conf` - Tmux configuration
- `.inputrc` - Readline configuration
- `.wgetrc` - Wget configuration
- `.curlrc` - Curl configuration
- `.config/kitty/` - Kitty terminal configuration

### macOS
- `.macos` - macOS system defaults and preferences

## Updating

To update dotfiles from the repository:

```bash
cd ~/dotfiles
git pull origin main
./bootstrap.sh
```

## Notes

- The installation scripts check for existing installations and skip if already installed
- Homebrew packages may take a while to install
- Some settings require logging out and back in to take effect
- SSH keys in `.ssh/` are included but private keys should be added manually
- Neovim will automatically install plugins on first launch (lazy.nvim)
- For Neovim, install additional dependencies: `ripgrep`, a Nerd Font, and language-specific tools (npm for TypeScript, go for Golang, etc.)

## License

MIT
