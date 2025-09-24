def tmux_session [] {
  try {
    let top_dirs = [
      ~/Developer/NCCloud
      ~/Developer/philipkrueck
    ] | each { |d| ($d | path expand) }
    let single_dirs = [
      ~/Downloads
      "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain"
      "~/.local/share/chezmoi"
    ] | each { |d| ($d | path expand)}
    let top_dirs_children = $top_dirs | each { |d| ls $d } | flatten | where type == "dir" | get name
    let dirs = $top_dirs_children ++ $single_dirs
    let session_path = $dirs | input list --fuzzy 'Choose a session'
    let session = $session_path | path basename

    let session = if ($session | str starts-with ".") {
      "_" + ($session | str substring 1..)
    } else {
      $session
    }

    try {
      tmux has-session -t $"=($session)"  # will throw an error if session doesn't exist
      echo $"Session exits: ($session)"
    } catch {
      tmux new-session -d -s $session -c $session_path # create a new session
      echo $"Created new session: ($session)"
    }

    try {
      $env.TMUX # will throw an error if not in tmux
      tmux switch-client -t $session
    } catch {
      tmux attach-session -t $session
    }
  } catch {
    echo "Cancelled."
  }
}

