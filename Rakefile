DOT_OBJS=['.vimrc', '.vim', '.zsh/.zshrc', '.tmux.conf']

desc "install"
task 'install' => ['symlink']

task 'symlink' do
  DOT_OBJS.each do |f|
    cd "#{ENV['HOME']}" do 
      `ln -s dotfiles/#{f} .`
    end
  end
end
