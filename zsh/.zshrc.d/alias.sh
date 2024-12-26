# Unclassified
alias ls='ls --color'
alias c='source ~/.zshrc && clear'

# Avoid mistakes when copying or (re)moving files.
alias rm='rm -i '
alias cp='cp -i '
alias mv='mv -i '

# Git
alias gco='git checkout '
alias gcb='git checkout -b '
alias gl='git log --pretty="format:%C(yellow)%h %C(blue)%ad %C(reset)%s%C(red)%d %C(green)%an%C(reset), %C(cyan)%ar" --date=short --graph --all'
alias gs='git status'

# Ctrl + C and Ctrl + V utility
# Credits: https://dev.to/djviolin/what-are-your-unix-pipeline-commands-that-saved-you-from-lot-of-codingtime-7ok/comments/185j
# Usage examples:
#   some_command | ctrlc
#   ctrlv | some_other_command
#   ctrlv >> some_file
alias ctrlc='xclip -selection clipboard -i'
alias ctrlv='xclip -selection clipboard -o'