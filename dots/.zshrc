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
plug "esc/conda-zsh-completion"
plug "esc/conda-zsh-completion"
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

# setup starship prompt
eval "$(starship init zsh)"

# setup fzf completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/philipkrueck/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/philipkrueck/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/philipkrueck/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/philipkrueck/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# fnm
export PATH="/Users/philipkrueck/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# zoxide
eval "$(zoxide init zsh)"
