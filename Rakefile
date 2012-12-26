desc("run at startup")
task :init => [:init_bundle]

task :init_bundle do
  vimbundlepath = File.join(ENV["HOME"], ".vimbundle")
  system "mkdir -p #{vimbundlepath}"
  Dir.chdir(vimbundlepath) do
    system "git clone https://github.com/Shougo/neobundle.vim.git" 
  end
end
