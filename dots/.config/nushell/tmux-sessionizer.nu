def tmux_sessionizer [] {
  try {
    let dirs = ls ~/Developer/Work | where type == "dir" | get Name
    let session_path = $dirs | input list --fuzzy 'Choose a session'
    let session = $session_path | path basename

    try {
      tmux has-session -t $session # will throw an error if session doesn't exist
    } catch {
      tmux new-session -d -s $session -c $session_path # create a new session
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

tmux_sessionizer
