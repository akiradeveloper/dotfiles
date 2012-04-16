USER_COPIES = { 
  ".wgetrc" => ENV["HOME"],
  ".curlrc" => ENV["HOME"],
  ".gitconfig" => ENV["HOME"],
  ".screenrc" => ENV["HOME"],
  ".tmux.conf" => ENV["HOME"],
  ".ssh/config" => "#{ENV["HOME"]}/.ssh",
  ".ssh/.authorize" => "#{ENV["HOME"]}/.ssh"
}

SYSTEM_COPIES = {
  "system/apt.conf" => "/etc/apt"
}
