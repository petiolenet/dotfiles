# Created by newuser for 5.9.2
#
# # History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completion
autoload -Uz compinit
compinit

# Useful aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# Reload this config
alias reload='source ~/.zshrc'

# Starship
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
