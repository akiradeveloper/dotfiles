require "pathname"
require "find"

module Kernel
  def system(cmd)
    dry_run = false
    if dry_run
      puts "dry-run command #{cmd}"
      return
    end
    $stderr.puts "DEBUG #{cmd}"
    Kernel.system(cmd)
  end
end

module Files

  # String(dir) -> [String(file)]
  def self.find_files_rel(root)
    xs = `find #{root}`.split("\n") 
    xs.delete_if { |e| not Pathname(e).file? }
    xs.map { |e| Pathname(e).relative_path_from(Pathname(root)).to_s }
  end
  
  # Map String(file) -> String(file) 
  def self.mk_rel_map(root, install_root)
    map = {}
    rels = find_files_rel(root)
    rels.each do |rel|
      from = File.join(root, rel)
      to = File.join(install_root, rel)
      map[from] = to
    end
    map 
  end
end

if __FILE__ == $0
  system("ls")
end
