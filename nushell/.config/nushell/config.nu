# config.nu
# Nushell Configuration File
# Version: 0.102.0+

# Create vendor directory if it doesn't exist
mkdir ($nu.data-dir | path join "vendor/autoload")

# Starship prompt
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zoxide integration
source ~/.zoxide.nu

# --- Custom Commands ---

# Enhanced yazi command with better error handling
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Quick directory navigation
def q [dir: string] {
    let target = match $dir {
        "d" => "~/Downloads",
        "c" => "~/.config",
        "p" => "~/Projects",
        "doc" => "~/Documents",
        _ => $dir
    }
    cd $target
}

# Enhanced git status with formatting
def gss [] {
    git status -s | lines | each {|line|
        let parts = ($line | split row ' ')
        let status = $parts.0
        let file = $parts.1
        match $status {
            "M" => { $"[(ansi green)modified(ansi reset)] ($file)" }
            "A" => { $"[(ansi yellow)added(ansi reset)] ($file)" }
            "D" => { $"[(ansi red)deleted(ansi reset)] ($file)" }
            "??" => { $"[(ansi blue)untracked(ansi reset)] ($file)" }
            _ => $line
        }
    }
}

# Quick directory listing with icons (simplified)
def lsg [] {
    ls | each {|file|
        let extension = ($file.name | path parse | get extension)
        let icon = match $extension {
            "nu" => "🐚",
            "rs" => "🦀", 
            "py" => "🐍",
            "js" => "📜",
            "ts" => "📘",
            "md" => "📝",
            "txt" => "📄",
            "zip" => "📦",
            "pdf" => "📕",
            _ => { if $file.type == "dir" { "📁" } else { "📄" } }
        }
        $"($icon) ($file.name)"
    }
}

# Simple calculator
def calc [expression: string] {
    python -c $"print(($expression))" 
}

# Show disk usage for current directory
def dus [] {
    du -h . | sort-by size | reverse
}

# --- Aliases (Organized by Category) ---

# Navigation
alias e = exit
alias . = cd ..
alias .. = cd ../.. 
alias ... = cd ../../..
alias p = pwd
alias cd = z  # zoxide integration

# File Operations
alias l = lsd
alias ll = lsd -l
alias la = lsd -a
alias lla = lsd -la
alias lt = lsd --tree
alias cat = bat
alias tree = eza -T
alias rm-safe = rm -I  # safer remove with confirmation

# Editors
alias nv = neovide
alias v = nvim
alias vi = nvim
alias vim = nvim

# Git (Enhanced)
alias gc = git commit -m
alias gp = git push
alias ga = git add .
alias gpl = git pull
alias gs = git status
alias gss = gss  # Use our custom git status
alias gcl = git clone
alias gr = git restore
alias gi = git init
alias gd = git diff
alias gco = git checkout
alias gb = git branch
alias gl = git log --oneline --graph --all

# Package Management
alias pacman = paru
alias pi = paru -S
alias pss = paru -Ss
alias pu = paru -Sy
alias puu = paru -Syu
alias pr = paru -Rns
alias pq = paru -Q
alias pqi = paru -Qi
alias pe = paru -Qe
alias pclean = paru -Sc  # Clean package cache

# System Utilities
alias df = df -h
alias free = free -h
alias top = btop
alias htop = btop
alias du = du -h

# Network
alias ip = ip -c a  # Colorized output
alias ping = ping -c 5
alias wget = wget -c  # Continue interrupted downloads

# Systemd
alias ss = systemctl status
alias sr = systemctl restart
alias ssr = systemctl start
alias ssp = systemctl stop
alias sen = systemctl enable
alias sdis = systemctl disable
alias journal = journalctl -xe

# Docker
alias dps = docker ps
alias di = docker images
alias dstart = docker start
alias dstop = docker stop
alias drm = docker rm
alias drmi = docker rmi
alias dcu = docker-compose up
alias dcd = docker-compose down

# Misc Utilities
alias hist = history
alias cls = clear
alias c = clear
alias time = timeit  # Nushell's built-in timing

# Application-specific
alias fs = fastfetch --logo ~/.config/fastfetch/fastfetch/space.png
alias ktheme = ~/.config/hypr/scripts/kitty-theme.sh
alias hint = ~/.config/hypr/scripts/key.sh
alias n-hint = ~/.config/nvim/lua/scripts/hint.sh

# --- Environment Configuration ---

# Custom themes
let dark_theme = {
    separator: white
    leading_trailing_space_bg: { attr: n }
    header: green_bold
    empty: blue
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: { bg: red fg: white }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: white bg: red attr: b}
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

# Main configuration
$env.config = {
    show_banner: false
    
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    
    table: {
        mode: rounded
        index_mode: always
    }
    
    error_style: "fancy"
    color_config: $dark_theme
    
    history: {
        max_size: 10000
        sync_on_enter: true
    }
    
    completions: {
        case_sensitive: false
        quick: true
        partial: true
    }
}

# Environment variables
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.BAT_THEME = "TwoDark"
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"

# --- External Scripts ---
source ~/.config/nushell/random-script.nu

