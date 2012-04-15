require 'erb'

module ERB::Template 
  Dirname = "/.erbt"
  def self.directory(dir)
    if Dir.exist?(dir)
      puts "the directory is already exists."
      return
    end
    system "mkdir -p #{dir}"
  end
  def self.tdir(f)
    File.dirname(f) + Dirname
  end
  def self.tf(f)
    tdir(f) + "/" + File.basename(f) 
  end

  class Logger
    SUCCESS = 0
    FAILURE = 1
    TAGS = [SUCCESS, FAILURE]
    def initialize
      @m = {}
    end
   
    def log(f, tag, message)
      @m[f] = {:tag => tag, :message => message}
    end

    def show
      success = {}
      failure = {}
      xs = [success, failure]
      @m.each do |f, e|
        xs[e[:tag]][f] = e
      end
      puts "[success]"
      # impl
      puts "[failure]"
      # impl
    end
  end
    
  class Cp
    def process(src, dest, logger)
      unless File.file?(src)
        msg = "the source #{dest} is not a file."
        logger.log(src, ERB::Template::Logger::FAILURE, msg)
        return
      end
      unless File.directory?(dest)
        msg = "the destination #{dest} is not a dir."
        return
      end
      tdir = dest + ERB::Template::Dirname
      directory(tdir)
      tf = tdir + "/" + File.basename(src)
      if File.exist?(tf)
        msg = "the template file (for #{src}) already exists."
        logger.log(src, ERB::Template::Logger::FAILURE, msg) 
        return
      end
      system "cp #{src} #{tf}"
      logger.log(src, ERB::Template::Logger::SUCCESS, "")
      return 
    end
  end

  class Update
    def process(f, logger)
      tf = ERB::Template.tf(f)
      unless File.exist?(tf)
        msg = "template file does not exist."
        logger.log(f, ERB::Template::Logger::FAILURE, msg)
        return 
      end
      content = `erb #{tf}`
      if content == File.read(f)
        msg = "the file does not need to be updated."
        logger.log(f, ERB::Template::Logger::FAILURE, msg)
        return 
      end
      system "echo #{content} > #{f}"
      logger.log(f, ERB::Template::Logger::SUCCESS, "")
      return 
    end
  end
end

if __FILE__ == $0
end
