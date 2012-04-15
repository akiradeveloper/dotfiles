require 'erb'

module ERB::Template 
  Dirname = "/.erbt"
  def self.directory(dir)
    if File.exist?(dir)
      puts "the directory #{dir} is already exists."
      return
    end
    puts "create directory #{dir}"
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
    def initialize(title)
      @title = title
      @m = {}
    end
   
    def log(f, tag, message)
      @m[f] = {:tag => tag, :message => message}
    end
    
    def __show(map)
      map.each do |f, e|
        print "#{f} (#{e[:message]})\n"
      end
    end

    def show
      success = {}
      failure = {}
      xs = [success, failure]
      @m.each do |f, e|
        xs[e[:tag]][f] = e
      end
      puts ""
      puts "******* Logging of #{@title} *******"
      puts "[success]"
      __show(success)
      puts "[failure]"
      __show(failure)
    end
  end
    
  class Cp
    def self.process(src, dest, logger, force=false)
      unless File.file?(src)
        msg = "the source #{src} is not a file."
        logger.log(src, ERB::Template::Logger::FAILURE, msg)
        return
      end
      unless File.directory?(dest)
        msg = "the destination #{dest} is not a dir."
        logger.log(src, ERB::Template::Logger::FAILURE, msg)
        return
      end
      tdir = dest + ERB::Template::Dirname
      ERB::Template.directory(tdir)
      tf = tdir + "/" + File.basename(src)
      if !force and File.exist?(tf)
        msg = "the template file for #{src} already exists."
        logger.log(src, ERB::Template::Logger::FAILURE, msg) 
        return
      end
      # TODO if the content is the same, do not copy.
      system "cp #{src} #{tf}"
      logger.log(src, ERB::Template::Logger::SUCCESS, "")
      return 
    end
  end

  class Update
    def self.process(f, logger, force=false)
      tf = ERB::Template.tf(f)
      unless File.exist?(tf)
        msg = "template file does not exist."
        logger.log(f, ERB::Template::Logger::FAILURE, msg)
        return 
      end
      content = `erb #{tf}`
      if !force and File.exist?(f) 
        msg = "the file already exists. never update."
        logger.log(f, ERB::Template::Logger::FAILURE, msg)
        return 
      end
      if File.exist?(f) and content == File.read(f)
        msg = "the file does not need to be updated."
        logger.log(f, ERB::Template::Logger::FAILURE, msg)
        return 
      end
      File.open(f, 'w') do |fd|
        fd.write(content)
      end
      logger.log(f, ERB::Template::Logger::SUCCESS, "")
      return 
    end
  end
end

if __FILE__ == $0
end
