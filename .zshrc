# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/marc/.oh-my-zsh"
# export FZF_DEFAULT_COMMAND='rg --hidden'
#
# FZF Marble
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#  --color=gutter:#f1f1f1,bg+:#f1f1f1,fg+:#424242
#  --color=hl:#008ec4,hl+:#008ec4,pointer:#008ec4
#  --color=prompt:#008ec4,info:#999999,bg:#f1f1f1'

# FZF Nord
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=gutter:#2e3440,bg+:#2e3440,fg+:#d8dee9
 --color=hl:#ebcb8b,hl+:#ebcb8b,pointer:#81a1c1
 --color=prompt:#81a1c1,info:#4c566a,bg:#2e3440'
 

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

alias vim='nvim'
alias ..='cd ..'
alias c='clear'

function gpages {
    cd mhoirup.github.io
    git add .
    git commit -m "$1"
    git push -u origin main
    cd ..
}

function gprojects {
    cd projects
    git add .
    git commit -m "$1"
    git push -u origin main
    ..
}

function dotfiles {
    git add .config/nvim
    git add .config/alacritty/alacritty.yml
    git add .config/ranger
    git add .tmux.conf
    git add .zshrc
    git commit -m "$1"
    git push -u origin main
}

# function dotfiles() {
#     rsync -r .config/nvim Dotfiles/
#     rsync -r .config/alacritty/alacritty.yml Dotfiles/
#     rsync -r .config/ranger/rc.conf Dotfiles/
#     rsync -r .tmux.conf Dotfiles/
#     rsync -r .zshrc Dotfiles/
#     rsync -r .ipython/custom_prompt.py Dotfiles/ipython/
#     rsync -r .ipython/profile_default/ipython_config.py Dotfiles/ipython/
#     cd Dotfiles
#     git add .
#     git commit -m "$1"
#     git push -u origin master
#     cd ~
# }

function gitpm() {
    cd pymetrics
    git add cross_section.py
    git add time_series.py
    git add plots/*
    git add readme.md
    git add utils.py
    git commit -m "$1"
    git push -u origin master
}

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
# DISABLE_MAGIC_FUNCTIONS=true

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
  zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX="true"

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
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias nvim="./nvim-osx64/bin/nvim"


PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} '
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -z $TMUX ]; then; tmux a; fi
