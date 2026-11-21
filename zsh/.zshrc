# Modified from: https://www.github.com/radleylewis/zsh
# Author: Khuong Pham
# GitHub: https://www.github.com/pham-k/dotfiles
#
# Uses:
#   Plugins:      fast-syntax-highlighting, zsh-autosuggestions,
#   Navigation:   zoxide, fzf

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

# =========================================================
# Completion
# =========================================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# =========================================================
# Modular Config Files
# =========================================================

# Aliases
if [[ -f "$XDG_CONFIG_HOME/zsh/aliases.zsh" ]]; then
    source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
fi

# Functions
if [[ -f "$XDG_CONFIG_HOME/zsh/functions.zsh" ]]; then
    source "$XDG_CONFIG_HOME/zsh/functions.zsh"
fi

# Plugins
if [[ -f "$XDG_CONFIG_HOME/zsh/plugins.zsh" ]]; then
    source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
fi

# EH secret
if [[ -f "$HOME/secrets_eh.zsh" ]]; then
    source "$HOME/secrets_eh.zsh"
fi

# EH aliases
if [[ -f "$HOME/aliases_eh.zsh" ]]; then
    source "$HOME/aliases_eh.zsh"
fi

# =========================================================
# Tools integration
# =========================================================

local tools=(
    # brew
    # bun
    # cargo
    # fzf
    # gvm
    # nvm
    # odin
    # omp
    # postgres
    # pyenv
    # rbenv
    # zoxide
)

for tool in $tools; do
    [[ -f "$XDG_CONFIG_HOME/zsh/${tool}.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/${tool}.zsh"
done
# aikido-endpoint-cert-config-start
# Allow Node.js tooling to trust the SafeChain MITM CA while preserving public roots.
export NODE_EXTRA_CA_CERTS="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-node-combined-ca.pem"
case "${NODE_OPTIONS:-}" in
  *--use-openssl-ca*) unset NODE_USE_SYSTEM_CA ;;
  *) export NODE_USE_SYSTEM_CA=1 ;;
esac
# aikido-endpoint-cert-config-end
# aikido-endpoint-pip-cert-config-start
# Allow Python package managers to trust the SafeChain MITM CA while preserving user-provided roots.
export PIP_CERT="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-pip-combined-ca.pem"
export REQUESTS_CA_BUNDLE="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-pip-combined-ca.pem"
export POETRY_CERTIFICATES_PYPI_CERT="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-pip-combined-ca.pem"
export UV_SYSTEM_CERTS=true
# aikido-endpoint-pip-cert-config-end
# aikido-endpoint-ruby-cert-config-start
# Allow Ruby Bundler to trust the SafeChain MITM CA while preserving public roots.
export BUNDLE_SSL_CA_CERT="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-ruby-combined-ca.pem"
# aikido-endpoint-ruby-cert-config-end
# aikido-endpoint-curl-cert-config-v2-start
# Allow curl and other OpenSSL-linked tools to trust the SafeChain MITM CA while preserving the system roots.
export SSL_CERT_FILE="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-openssl-combined-ca.pem"
export CURL_CA_BUNDLE="/Library/Application Support/AikidoSecurity/EndpointProtection/run/endpoint-protection-openssl-combined-ca.pem"
# aikido-endpoint-curl-cert-config-v2-end
