export GOPATH=$HOME/Code/golib
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$GOPATH/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Most liked themes:
# powerlevel10k
# spaceship

# User configuration for theme
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

CASE_SENSITIVE="true" # Case-sensitive completion.

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

DISABLE_AUTO_UPDATE="false" # disable bi-weekly update
DISABLE_UPDATE_PROMPT="false" # disable prompt and update automatically
DISABLE_MAGIC_FUNCTIONS=false # parse URL and other text stuff

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

HIST_STAMPS="dd/mm/yyyy" # date stamps

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  terraform
  git
  autojump
  aws
  tmux
  python
  pip
  golang
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Zed alias
alias zed="open -a /Applications/Zed.app -n"

# Zsh highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
