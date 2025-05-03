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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
export PATH="$PATH:/~/.rd/bin"
