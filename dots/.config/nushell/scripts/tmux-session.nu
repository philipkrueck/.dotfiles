def tmux_session [] {
  try {
    let top_dirs = [
      ~/Developer/Work
      ~/Developer/Personal
      ~/Developer/Masters
      ~/Developer/Masters/AI
      ~/Developer/Masters/AOS
      ~/Developer/Masters/KBAI
      ~/Developer/Masters/SDP
      ~/Developer/Masters/NLP
      ~/Developer/Masters/GPUHS
    ]

    let dirs = $top_dirs | each { |d| ls ($d | path expand) } | flatten  | where type == "dir" | get name
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

