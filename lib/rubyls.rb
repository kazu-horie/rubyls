require "rubyls/version"

module Rubyls
  class Error < StandardError; end

  def self.ls(path)
    begin
      if RUBY_VERSION.to_f >= 2.5
        Dir.children(path).each do |c|
          print "#{c}\t"
        end
      else
        Dir.entries(path)[2..-1].each do |c|
          print "#{c}\t"
        end
      end
      puts
    rescue Errno::ENOENT
      puts "ls: #{ARGV[0]}: No such file or directory"
    end
  end
end
