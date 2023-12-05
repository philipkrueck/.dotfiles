# .dotfiles

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
