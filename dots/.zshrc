# Variables
DOTFILES=~/Developer/Personal/dotfiles

# Append bins to path
export PATH="$HOME/.local/bin:$PATH"

# Load plugins
# zsh plugins via zap
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"
# Load and initialise completion system
autoload -Uz compinit
compinit

# add tmux-sessionizer keybinding
bindkey -s "^f" "tmux-sessionizer\n"

# Load aliases
source $DOTFILES/aliases/random.zsh
source $DOTFILES/aliases/git.zsh
source $DOTFILES/aliases/work.zsh # TODO: need to encrypt this

# Use GNU tools installed via brew over MacOS 
PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# Escape square brackets by default
unsetopt nomatch

# add gcloud to path
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True


# setup fzf completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH="/Users/philipkrueck/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# zoxide
eval "$(zoxide init zsh)"

# starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# add Pulumi to the PATH
export PATH=$PATH:/Users/philipkrueck/.pulumi/bin
