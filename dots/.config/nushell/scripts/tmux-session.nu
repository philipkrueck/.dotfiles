def tmux_session [] {
  try {
    let top_dirs = [
      ~/Developer/Work
      ~/Developer/Personal
    ]
    let single_dirs = [
      "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain"
      "/Users/philipkrueck/Downloads"
    ]
    let top_dirs_children = $top_dirs | each { |d| ls ($d | path expand) } | flatten  | where type == "dir" | get name
    let dirs = $top_dirs_children ++ $single_dirs
    let session_path = $dirs | input list --fuzzy 'Choose a session'
    let session = $session_path | path basename

    try {
      tmux has-session -t $session # will throw an error if session doesn't exist
    } catch {
      tmux new-session -d -s $session -c $session_path # create a new session
      echo "Created new session: $session"
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

