require File.dirname(__FILE__) + "/../configure"
require File.dirname(__FILE__) + "/erbt/erbt"

def process(map)
  cp_logger = ERB::Template::Logger.new("Cp")
  update_logger = ERB::Template::Logger.new("Update")
  map.each do |src, dest|
    ERB::Template::Cp.process(src, dest, cp_logger)
    ERB::Template::Update.process(dest + "/" + File.basename(src), update_logger)
  end
  cp_logger.show
  update_logger.show
end

def purge(map)
  puts "purging ..."
  map.each do |src, dest|
    file = dest + "/" + File.basename(src)
    tf = ERB::Template.tf(file)
    system "rm #{file}"
    system "rm #{tf}"
    p file
    p tf
  end
end