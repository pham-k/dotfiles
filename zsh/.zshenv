
# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$HOME"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- PATH ----------
# Remove duplicates
typeset -U PATH path

# Personal binaries/scripts
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
# etcd
export PATH="/opt/etcd/bin:$PATH"
# flutter
export PATH="/opt/flutter_3.2.9/bin:$PATH"
# go
export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
# gvm
export PATH="/Users/phamk/.gvm/go/bin:$PATH"
export PATH="/Users/phamk/.gvm/tools-bin:$PATH"
# python
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
# sendbox
export LOCAL_REPOS_DIR='/Users/phamk/Documents/work'
