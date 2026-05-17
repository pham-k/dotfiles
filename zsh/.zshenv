
# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME=l

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- PATH ----------
# Remove duplicates
typeset -U PATH path

# Personal binaries/scripts
export GOPATH="$HOME/go"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/flutter_3.2.9/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="/opt/etcd/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
