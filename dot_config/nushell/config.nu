$env.config.show_banner = false # disable showing the welcome banner

$env.config.edit_mode = "vi" # vi mode when editing command

$env.config.cursor_shape = { # make cursor shape same as in nvim
    vi_insert: line
    vi_normal: block
}

$env.config.keybindings = [
    {
      name: tmux_sessionizer
      modifier: CONTROL
      keycode: Char_f
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "tmux_session"
      }
    }
    {
      name: tmux_sessionizer
      modifier: CONTROL
      keycode: Char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "kctx"
      }
    }
]


# SETUP PATH

use std/util "path add"
path add /opt/homebrew/bin
path add ~/.local/bin
path add ~/.cargo/bin

# MISE SETUP

source ~/.config/nushell/mise.nu # setup mise with nushell

# ENVIRONMENT

$env.EDITOR = "nvim"

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu

$env.STARSHIP_CONFIG = "/Users/philipkrueck/.config/starship/starship.toml"
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional


mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

# WORK ENVIRONMENT
source ~/.config/nushell/namecheap/env.nu # Env for namecheap

# ALIASES
source aliases/git.nu
source aliases/k8s.nu
source aliases/random.nu
# source aliases/work.nu

# ENVIRONMENT
source ~/.config/nushell/mise.nu
source scripts/tmux-session.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
