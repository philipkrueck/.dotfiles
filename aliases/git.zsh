alias gi='git init' # todo add github repo creation + connection

alias gl='git log'
alias glp='git log --graph --pretty=oneline --abbrev-commit' # git log w/t pretty history

alias gco='git checkout'
alias gcob='git checkout -b'

alias gss='git status'
alias gst='git status'

alias ga='git add'
alias gaa='git add -A'

alias gc='git commit -v'
alias gca='git commit -a -v'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcamend='git commit --amend'

alias gpl='git pull'
alias gplf='git pull --force'
alias gplr='git pull --rebase'

alias gp='git push'
alias gpf='git push --force'

alias gd='git diff'

alias grb='git rebase'
alias grbc='git rebase --continue'

alias gsh='git stash'
alias gsha='git stash apply'

alias gl='git log | n -R'

alias pr='gh pr create -f "$@"'

alias ghr='gh release create ${1?"Specify tag"} --generate-notes'

# TODO: write an alias to delete all merged branches locally and remotely
# inspiration: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases
