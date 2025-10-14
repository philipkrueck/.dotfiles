# ------------------------
# History-related settings
# ------------------------
$env.config.history.file_format = "sqlite" # provides more advanced history features rather than plaintext
$env.config.history.max_size = 5_000_000 # increased history size


# ----------------------
# Miscellaneous Settings
# ----------------------
$env.config.show_banner = false # disable showing the welcome banner

# ---------------------------
# Commandline Editor Settings
# ---------------------------
$env.config.edit_mode = "vi" # vi mode when editing command

$env.config.cursor_shape.vi_insert = "line"  # make cursor shape same as in nvim
$env.config.cursor_shape.vi_normal = "block" # make cursor shape same as in nvim


# -----------
# Keybindings
# -----------
$env.config.keybindings ++= [
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
      name: kube_context
      modifier: CONTROL
      keycode: Char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        send: executehostcommand,
        cmd: "kctx"
      }
    }
]


# ---------------------
# Environment Variables
# ---------------------


# SETUP PATH
use std/util "path add"
path add /opt/homebrew/bin
path add ~/.local/bin
path add ~/.cargo/bin

# MISE 
source ~/.config/nushell/mise.nu # setup mise with nushell

# CARAPACE
source ~/.cache/carapace/init.nu

# ATUIN
source ~/.local/share/atuin/init.nu

# STARSHIP
# https://starship.rs/#nushell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# ENVIRONMENT
$env.EDITOR = "nvim"

# WORK ENVIRONMENT
source ~/.config/nushell/namecheap/env.nu # Env for namecheap


# ALIASES
source aliases/git.nu
source aliases/k8s.nu
source aliases/random.nu


# SCRIPTS
source scripts/tmux-session.nu


# TODO: figure out why vivid is not there
# -----------
# Colors
# -----------
# $env.LS_COLORS = (vivid generate catppuccin-mocha)
