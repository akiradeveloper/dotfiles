require File.expand_path("lib/dotfiles", File.dirname(__FILE__))
require File.expand_path("configure", File.dirname(__FILE__))

namespace :root do

  task :ln do
    DOTFILES_ROOT_LN.each do |from, to|
      Dotfiles.cp(from, to)
    end
  end

  task :cp do
    DOTFILES_ROOT_CP.each do |from, to|
      Dotfiles.ln(from, to)
    end
  end

  task :misc

  desc("install(root)")
  task :install => [:ln, :cp, :misc]
  desc("uninstall")
  task :uninstall do
    DOTFILES_ROOT_LN.each do |from, to|
      system "rm #{to}"
    end
    DOTFILES_ROOT_CP.each do |from, to|
      system "rm #{to}"
    end
  end

  desc("reinstall")
  task :reinstall => [:uninstall, :install]
end

desc("initialize. run this at the very first.")
task :init do
  system("cp -n .dotfiles.conf ~") 
  system("cp -n .rc.local ~")
  system("cp -n .profile.local ~")

  Dir.chdir(File.join(ENV["HOME"], ".vimbundle")) do
    system("git clone http://github.com/Shougo/neobundle.vim.git")
  end
end

compile_map = Files.mk_rel_map("user/src", "user/build").
  merge Files.mk_rel_map("root/src", "root/build")

desc("compile(user and root)")
task :compile do
  compile_map.each do |from, to|
    Dotfiles.compile(from, to)
  end
end

desc("clean")
task :clean do
  compile_map.each do |from, to|
    system "rm #{to}"
  end
end

desc("recompile")
task :recompile => [:clean, :compile]

task :ln do
  DOTFILES_LN.each do |from, to|
    Dotfiles.ln(from, to)
  end
end

task :cp do
  DOTFILES_CP.each do |from, to|
    Dotfiles.cp(from, to)
  end
end

task :misc do 
  FileList[File.join(ENV["HOME"], "bin/*")].each do |binfile|
    next unless Pathname(binfile).file?
    system("chmod +x #{binfile}")
  end

  Dir.chdir(File.join(ENV["HOME"], ".vimbundle/vimproc")) do
    system("make -f make_unix.mak")
  end
end

desc("install(user)")
task :install => [:cp, :ln, :misc]

desc("uninstall(this will remove everything including pre-existing files)")
task :uninstall do 
  DOTFILES_CP.each do |from, to|
    system "rm #{to}"
  end
  DOTFILES_LN.each do |from, to|
    system "rm #{to}"
  end
end

desc("reinstall")
task :reinstall => [:uninstall, :install]
