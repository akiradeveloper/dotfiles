# set FORCE true will delete the existing files, not otherwise.
FORCE=false

USER_LINKS = {
  ".vim" => ENV["HOME"],
  ".vimrc" => ENV["HOME"],
  ".zsh" => ENV["HOME"],
  ".zsh/.zshenv" => ENV["HOME"]
}

USER_COPIES = { 
  ".wgetrc" => ENV["HOME"],
  ".curlrc" => ENV["HOME"],
  ".gitconfig" => ENV["HOME"],
  ".screenrc" => ENV["HOME"],
  ".tmux.conf" => ENV["HOME"],
  ".ssh/config" => "#{ENV["HOME"]}/.ssh",
  ".ssh/.authorize" => "#{ENV["HOME"]}/.ssh",
  "bin/git-proxy" => "#{ENV["HOME"]}/local/bin"
}

SYSTEM_COPIES = {
  "system/apt.conf" => "/etc/apt"
}
