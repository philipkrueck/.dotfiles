# .dotfiles

## Philosophy

### Fast Bootstrap

I want to be able to get a new computer and be up and running within an hour.
The amount of manual work should be minimal and documented.

### The Stateless Workstation

The goal is to have a workstation that doesn't have localized state.

The entire state of my workstation should be restorable from remote storage. This includes code from git repos, applications from configuration or scripts, and data from cloud storage.

### Reproducibility

## Installation

These are my personal dotfiles in order to bootstrap a new computer.

### 1. install homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- then paste the commands indicated by brew installer

### 2. install ansible

```
brew install ansible
```

### 3. clone repo

```
mkdir -p ~/Developer/Personal
```

```
git clone https://github.com/philipkrueck/.dotfiles ~/Developer/Personal/dotfiles
```

```
cd ~/Developer/Personal/dotfiles
```

### 4. run ansible

```
ansible-playbook local.yml --ask-vault-pass
```
