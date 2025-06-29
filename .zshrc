# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# set -x
# exec 2>zsh.err

zmodload zsh/zprof

#
zmodload zsh/zprof
# Q pre block. Keep at the top of this file.
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -Uz compinit
compinit

# Path to your oh-my-zsh installation.
export ZSH="/Users/julian/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

ZSH_THEME="powerlevel9k/powerlevel9k"

# powerlevel9k config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir virtualenv kubecontext vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
# segment color
# ssh
POWERLEVEL9K_SSH_BACKGROUND='none'
# dir
POWERLEVEL9K_DIR_HOME_FOREGROUND='004'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='004'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='004'
POWERLEVEL9K_DIR_HOME_BACKGROUND='none'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='none'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='none'
#virtualenv
POWERLEVEL9K_VIRTUALENV_FOREGROUND='005'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='none'
# kubecontext
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='039'
POWERLEVEL9K_KUBECONTEXT_BACKGROUND='none'
# vcs
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='002'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='003'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='001'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='none'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='none'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='none'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ntnu="cd ~/Documents/Skole/OneDrive\ -\ NTNU.nosync/V2025/"

function cat {
    bat --style=plain "$@"
}

alias ls='ls -all --color'

alias pn="pnpm"
alias cat="bat"

alias python="python3"

. ~/.config/z.sh

alias ui="'lazygit'"

alias dt-proxy-dev="cloud-sql-proxy dt-dev-169909:europe-west1:postgres02-europe-west-1 --port 8432"

# export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias vim="lvim"

# bun completions
[ -s "/Users/julian/.bun/_bun" ] && source "/Users/julian/.bun/_bun"

# bun
export BUN_INSTALL="/Users/julian/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/julian/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# lvim
export PATH="$HOME/.local/bin:$PATH"

# flutter
export PATH="$HOME/dev/flutter/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# eval "$(/opt/homebrew/bin/brew shellenv)"

# Add secretive as a source of SSH agent
export SSH_AUTH_SOCK=/Users/julian/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# For MiKTeX
export PATH="/Users/julian/bin:$PATH"
export PATH="~/bin:$PATH"
#
# [[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

export GO_PATH=~/go
export PATH=$PATH:/$GO_PATH/bin

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  exec exec tmux 
  # exec exec tmux new-session -A -s main
fi

# Q post block. Keep at the bottom of this file.
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/julian/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/julian/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/julian/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/julian/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/julian/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="/opt/homebrew/opt/icu4c@76/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c@76/sbin:$PATH"
export PATH=~/Users/julian/bin:$PATH

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
