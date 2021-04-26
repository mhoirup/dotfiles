# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/marc/.oh-my-zsh"
export FZF_DEFAULT_COMMAND='rg --files --hidden' 

# Nord theme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=gutter:#2e3440,bg+:#2e3440,fg+:#d8dee9
 --color=hl:#ebcb8b,hl+:#ebcb8b,pointer:#81a1c1
 --color=prompt:#81a1c1,info:#4c566a,bg:#2e3440'

# Github theme
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#  --color=gutter:#ffffff,bg+:#ffffff,fg+:#24292e
#  --color=hl:#d73a49,hl+:#d73a49,pointer:#24292e
#  --color=prompt:#24292e,info:#d1d5da,bg:#ffffff'
 
ZSH_THEME="robbyrussell"

export EDITOR='nvim'
export VISUAL='nvim'

setopt rmstarsilent

alias vim='nvim'
alias ..='cd ..'
alias home='cd ~'
alias c='clear'
alias nvim='nvim $(fzf)'
alias files='ranger'

function gpages {
    cd ~ # Navigate to the home directory in case it isn't there already
    cd mhoirup.github.io # Navigate to mhoirup.github.io
    git add . # Add everything not exluded by .gitignore
    git commit -m "$1" # Commit changes with function argument as message
    git branch -M main # Switch to the main branch
    git push -u origin main # Push to the main branch
    rake # Builds the site and pushes the proper content to the gh-pages branch
    git switch main # Switch back the to main branch
    rm -rf * # Removes all files (since all files are those in gh-pages brach)
    cd ~ # Navigate back home
    git clone https://github.com/mhoirup/mhoirup.github.io.git temp # Clone repo
    mv temp/* mhoirup.github.io # Copy contents of temp into mhoirup.github.io
    rm -rf temp # Remove the temp dir
}

function gprojects {
    cd ~ # Navigate to the home directory in case it isn't there already
    cd Code # Navigate to ~/Code/
    git add . # Add everything not exluded by .gitignore
    git commit -m "$1" # Commit changes with function argument as message
    git push -u origin main # Push to the main branch
    cd ~ # Navigate back home
}

function dotfiles {
    cp /Users/marc/Library/Application\ Support/Code/User/keybindings.json ~/.code
    cp /Users/marc/Library/Application\ Support/Code/User/settings.json ~/.code
    cp /Users/marc/Library/Application\ Support/Code/User/snippets ~/.code/snippets
    git add .code/*
    git add .config/nvim
    git add .config/alacritty/alacritty.yml
    git add .config/ranger
    git add .tmux.conf
    git add .zshrc
    git add .Rprofile
    git commit -m "$1"
    git push -u origin main
}

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} '
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# if [ -z $TMUX ]; then; tmux a; fi
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
