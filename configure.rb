require File.expand_path("lib/dotfiles/util", File.dirname(__FILE__)) 

home = ENV["HOME"]

user_build_map = Files.mk_rel_map("user/build", home) 
root_build_map = Files.mk_rel_map("root/build", "/")

user_default_map = {
  ".vim" => File.join(home, ".vim"),
  ".vimrc" => File.join(home, ".vimrc"),
  ".zsh" => File.join(home, ".zsh"),
  ".zsh/.zshenv" => File.join(home, ".zshenv"),
}

DOTFILES_LN = user_default_map.merge user_build_map
DOTFILES_CP = {}
DOTFILES_ROOT_LN = root_build_map
DOTFILES_ROOT_CP = {}
