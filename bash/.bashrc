#!/bin/bash

# Execute a random script
scripts=($HOME/.config/nushell/scripts/*.sh)
chosen_script=${scripts[RANDOM % ${#scripts[@]}]}
bash "$chosen_script"

# -------------------------------------------------------------

# All other aliases
alias e='exit'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias l='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias cat='bat'
alias c='clear'
alias p='pwd'
alias nv='neovide'
alias v='nvim'
alias gc='git commit -m'
alias gp='git push'
alias ga='git add .'
alias gpl='git pull'
alias gs='git status'
alias gcl='git clone'
alias gr='git restore'
alias gi='git init'
alias pacman='paru'
alias pi='paru -S'
alias pss='paru -Ss'
alias pu='paru -Sy'
alias puu='paru -Syu'
alias pr='paru -Rns'
alias pq='paru -Q'
alias pqi='paru -Qi'
alias pe='paru -Qe'
alias df='df -h'
alias free='free -h'
alias top='btop'
alias ip='ip a'
alias ping='ping -c 5'
alias mount='mount | column -t'
alias umount='umount'
alias ss='systemctl status'
alias sr='systemctl restart'
alias ssr='systemctl start'
alias ssp='systemctl stop'
alias sen='systemctl enable'
alias sdis='systemctl disable'
alias dps='docker ps'
alias di='docker images'
alias dstart='docker start'
alias dstop='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias hist='history'
alias cls='clear'
alias fs='fastfetch --logo ~/.config/fastfetch/fastfetch/space.png'
alias ktheme='~/.config/hypr/scripts/kitty-theme.sh'
alias hint='~/.config/hypr/scripts/key.sh'
alias n-hint='~/.config/nvim/lua/scripts/hint.sh'

# -------------------------------------------------------------

# Zoxide initialization MUST be last
export _ZO_DOCTOR=0
eval "$(zoxide init bash)"
alias cd='z'

# Starship initialization
eval "$(starship init bash)"
