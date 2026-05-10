#######################################
# Path
#######################################
# Remove duplicated entries from $PATH, zsh uses $path array along with $PATH 
typeset -U PATH path

export GOPATH="$HOME/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/flutter_3.2.9/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"
export PATH="/opt/etcd/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
# export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.eh-dev/bin:$PATH"

#######################################
# Homebrew
#######################################
export HOMEBREW_NO_AUTO_UPDATE=1

#######################################
# Pyenv
#######################################
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"

#######################################
# Terraform
#######################################
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

#######################################
# Nvm
#######################################
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#######################################
# Dart
#######################################
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/phamk/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/phamk/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
