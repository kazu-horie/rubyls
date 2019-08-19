require "rubyls/version"

module Rubyls
  class Error < StandardError; end

  def self.ls(path)
    begin
      Dir.entries(path)[2..-1].each do |c|
        print "#{c}\t"
      end
      print "\n"
    rescue Errno::ENOENT
      puts "ls: #{path}: No such file or directory"
    end
  end
end
