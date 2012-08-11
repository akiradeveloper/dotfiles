require File.expand_path("dotfiles/util", File.dirname(__FILE__))
require File.expand_path("dotfiles/dotfiles", File.dirname(__FILE__))

module Dotfiles

  def self.compile(from, to)
    $stderr.puts "Dotfiles.compile #{from} #{to}"
    Dotfiles::Compile.process(from, to)
  end

  def self.ln(from, to)
    $stderr.puts "Dotfiles.ln #{from} #{to}"
    Dotfiles::Ln.process(from, to)
  end

  def self.cp(from, to)
    $stderr.puts "Dotfiles.cp #{from} #{to}"
    Dotfiles::Cp.process(from, to)
  end
end
