require File.expand_path(File.dirname(__FILE__)) + "/common"

[".vimrc", ".vim", ".zsh", ".zsh/.zshenv"].each do |f|
  system "ln -s dotfiles/#{f} $HOME"   
end

purge(USER_COPIES)
process(USER_COPIES)

system "chmod +x bin/git-proxy"
