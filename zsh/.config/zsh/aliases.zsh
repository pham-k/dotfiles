# Unclassified
alias ls='ls --color'
alias c='source ~/.zshrc && clear'

# Avoid mistakes when copying or (re)moving files.
alias rm='rm -i '
alias cp='cp -i '
alias mv='mv -i '

# Ctrl + C and Ctrl + V utility
# Credits: https://dev.to/djviolin/what-are-your-unix-pipeline-commands-that-saved-you-from-lot-of-codingtime-7ok/comments/185j
# Usage examples:
#   some_command | ctrlc
#   ctrlv | some_other_command
#   ctrlv >> some_file
alias ctrlc='xclip -selection clipboard -i'
alias ctrlv='xclip -selection clipboard -o'

# tldr
alias tldr='tldr --color always'

# Gemini
alias gemini='NO_COLOR= gemini'

# Claude
alias claude='FORCE_COLOR=1 claude --model claude-haiku-4-5-20251001'
