# .dotfiles

These are my personal dotfiles in order to bootstrap a new computer.

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ansible

ansible-playbook local.yml --ask-vault-pass
