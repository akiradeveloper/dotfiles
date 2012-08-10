require "pathname"
require File.expand_path("util", File.dirname(__FILE__))

module Dotfiles

  class Compile

    def self.process(src, dest)
      # Trim mode 2
      content = `erb -T 2 #{src}`
      if Pathname(dest).exist?
        return 
        if File.read(dest) == content
          return 
        end
      end
      system "mkdir -p #{File.dirname(dest)}"
      File.open(dest, 'w') do |fd|
        $stderr.puts "DEBUG write to #{dest}"
        fd.write(content)
      end
      return 
    end
  end

  class Ln
    def self.process(src, dest)
      real = File.expand_path(src)
      virt = dest
      system "mkdir -p #{File.dirname(virt)}"
      system "ln -s #{real} #{virt}" 
    end
  end

  class Cp
    def self.process(src, dest)
      if Pathname(dest).exist?
        return
        if File.read(dest) == File.read(src)
          return
        end
      end
      system "mkdir -p #{File.dirname(dest)}"
      system "cp #{src} #{dest}"
      return 
    end
  end
end

if __FILE__ == $0
end
