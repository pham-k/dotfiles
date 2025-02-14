# Remove duplicated entries from $PATH, zsh uses $path array along with $PATH 
typeset -U PATH path

export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_NO_AUTO_UPDATE=1