# micro is a better version of nano
alias nano='micro'

# bat is a better version of cat
alias cat='bat'

# exa is a better version of ls
alias ls='exa'

# sourcing of zshrc changes
alias sc='source $HOME/.zshrc'

# empty the trash
alias emptytrash='sudo rm -rf $HOME/.local/share/Trash/files'

# save contents of stdin to clipboard
alias clip='pbcopy'
alias cl='pbcopy'

# use python3 when interpreting python files
alias python='python3'

# neovim shortcut
alias n='nvim'

alias h='history'

# kubernetes shortcut
alias k='kubectl'

# docker shortcuts
alias d='docker'
alias dc='docker-compose'

# deploy to dev env
gpd() {
    git push origin $(git rev-parse --abbrev-ref HEAD):dev -f
}

# easily switch google cloud accounts:
alias gcloudwork='gcloud config set account pkrueck@genesiscloud.com'
alias gcloudprivate='gcloud config set account philipkrck@gmail.com'

# update apple developer tools
alias xcodeupdate='sudo softwareupdate -i -a; xcode-select --install'
