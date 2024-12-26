# Remove duplicated entries from $PATH, zsh uses $path array along with $PATH 
typeset -U PATH path

export GOPATH="$HOME/go"
export PATH="$HOME/opt/flutter_3.24.3/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.amplify/bin:$PATH"
export PATH="/opt/homebrew/Cellar/postgresql@15/15.7/bin/:$PATH"
export PATH="/usr/local/mysql/bin/:$PATH"
export PATH="/opt/homebrew/opt/mysql@8.0/bin/:$PATH"
export PATH="/Library/PostgreSQL/16/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export HOMEBREW_NO_AUTO_UPDATE=1