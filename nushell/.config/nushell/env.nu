# env.nu
#
# Installed by:
# version = "0.102.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
use std "path add"


# Add ~/.local/bin to the beginning of the PATH
path add ($env.HOME | path join ".local" "bin")

path add ($env.HOME | path join ".sdk" "jdk-24.0.1" "bin")

path add ($env.HOME | path join ".sdk" "apache-maven" "bin")

path add ($env.HOME | path join ".sdk" "gradle" "bin")

path add ($env.HOME | path join ".sdk" "maven-mvnd")

path add ($env.HOME | path join ".sdk" "go" "bin")

path add ($env.HOME | path join ".sdk" "node" "bin")

path add ($env.HOME | path join ".flutter" "flutter" "bin")

path add ($env.HOME | path join ".sdk" "c#")

path add ($env.HOME | path join ".sdk" "zig")

path add ($env.HOME | path join ".sdk" "platform-tools")

path add ($env.HOME | path join ".sdk" "kobweb" "bin")

# ************************ Tools **************************** 
# Vscode
path add ($env.HOME | path join "Tools" "VSCode-linux-x64" "bin")

path add ($env.HOME | path join "Tools" "nvim-linux-x86_64" "bin")

path add ($env.HOME | path join "Tools" "firefox")

path add ($env.HOME | path join "Tools" "uv-x86_64")

path add ($env.HOME | path join "Tools" "paru" "bin")

path add ($env.HOME | path join "Tools" "git" "bin")

path add ($env.HOME | path join "Tools" "btop" "bin")

path add ($env.HOME | path join "Tools" "yazi")

# path add ($env.HOME | path join "Tools" "rsync" "bin")

path add ($env.HOME | path join "Tools" "lsd" "bin")

path add ($env.HOME | path join "Tools" "bat" "bin")

path add ($env.HOME | path join "Tools" "cyme" "bin")

path add ($env.HOME | path join "Tools" "tmux" "bin")

path add ($env.HOME | path join "Tools" "starship" "bin")

path add ($env.HOME | path join "Tools" "nerdfetch" "bin")

path add ($env.HOME | path join "Tools" "warp" "opt" "warpdotdev" "warp-terminal")

path add ($env.HOME | path join "Tools" "onefetch" "bin")

path add ($env.HOME | path join "Tools" "scc" "bin")

path add ($env.HOME | path join "Tools" "mufetch" "bin")

path add ($env.HOME | path join "Tools" "yatto" "bin")

path add ($env.HOME | path join "Tools" "superfile" "bin")

path add ($env.HOME | path join "Tools" "zellij" "bin")

path add ($env.HOME | path join "Tools" "crush")

path add ($env.HOME | path join "Tools" "btm" "bin")

path add ($env.HOME | path join "Tools" "trip" "bin")

path add ($env.HOME | path join "Tools" "lazygit" "bin")

path add ($env.HOME | path join "Tools" "jj" "bin")

path add ($env.HOME | path join "Tools" "dysk" "bin")

path add ($env.HOME | path join "Tools" "eza" "bin")

path add ($env.HOME | path join "Tools" "zoxide" "bin")

path add ($env.HOME | path join "Tools" "ripgrep" "bin")

path add ($env.HOME | path join "Tools" "gping" "bin")

path add ($env.HOME | path join "Tools" "ffmpeg" "bin")

path add ($env.HOME | path join "Tools" "thunderbird")

path add ($env.HOME | path join "Tools" "opencode" "bin")

#--------------------init tools-----------------------
zoxide init nushell | save -f ~/.zoxide.nu

# -------------------Env-----------------------------------

$env.GEMINI_API_KEY = "AIzaSyBdPoyd7m4my9oDaTSnRsTqYr8HccTi4Ys"

