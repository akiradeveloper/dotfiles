require File.expand_path(File.dirname(__FILE__)) + "/common"

USER_LINKS.each do |src, dest|
  system "ln -s dotfiles/#{src} #{dest}"
end

process(USER_COPIES)

system "chmod +x $HOME/local/bin/git-proxy"
