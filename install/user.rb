require File.dirname(__FILE__) + "/common"

[".vimrc", ".vim", ".zsh/.zshenv"].each do |f|
  system "ln -s dotfiles/#{f} $HOME"   
end

process(USER_COPIES)
