def github_repos [org symbol] {
  let repos_base_path = "~/Developer" | path expand
  let org_path = $repos_base_path | path join $org

  ls $org_path | each { |repo| 
    let repo_name = $repo | (get name | path basename) 
    let gh_path = $org | path join $repo_name
    let full_path = $repos_base_path | path join $gh_path
    { symbol: $symbol, name: $gh_path, path: $full_path }
  }
}

let single_projects =  [
    { symbol: "☍", name: "Brain", path: ("~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain" | path expand) }
    { symbol: "∼", name: "dotfiles", path: ("~/.local/share/chezmoi" | path expand) }
    { symbol: "↓", name: "Downloads", path: ("~/Downloads" | path expand) }
  ]

def tmux_session [] {
  try {
    let work_repos = github_repos "NCCloud" "≡"
    let personal_repos = github_repos "philipkrueck" "✦"
    let repos = $single_projects ++ $personal_repos ++ $work_repos

    let selectable_names = $repos | each { |repo| $repo.symbol ++ " " ++ $repo.name }
    echo repo_names

    let session_idx = $selectable_names | input list --fuzzy --index "Choose a session"

    echo $session_idx
    let session_name = $repos | get $session_idx | get name
    let session_path = $repos | get $session_idx | get path

    echo $session_name
    echo $session_path

    try {
      tmux has-session -t $"=($session_name)"  # will throw an error if session doesn't exist
      echo $"Session exits: ($session_name)"
    } catch {
      tmux new-session -d -s $session_name -c $session_path # create a new session
      echo $"Created new session: ($session_name)"
    }

    try {
      $env.TMUX # will throw an error if not in tmux
      tmux switch-client -t $session_name
    } catch {
      tmux attach-session -t $session_name
    }
  } catch {
    echo "Cancelled."
  }
}



