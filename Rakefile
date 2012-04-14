DOT_FILES = ['.vimrc', '.vim', '.zsh/.zshenv']

desc "install"
task 'install' => ['symlink']

task 'symlink' do
  DOT_FILES.each do |f|
    cd "#{ENV['HOME']}" do 
      `ln -s dotfiles/#{f} .`
    end
  end
end

ERB_FILES = {
  ".wgetrc" => "~/",
  ".xsession" => "~/",
  ".gitconfig" => "~/",
  ".tmux.conf" => "~/",
  ".curlrc" => "~/",
  ".screenrc" => "~/"
}

SYS_FILES = {
  "system/apt.conf" => "/etc/apt/"
}
    

