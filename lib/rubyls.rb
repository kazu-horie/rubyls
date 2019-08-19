require "rubyls/version"

module Rubyls
  class Error < StandardError; end

  def self.ls(path: '.')
    begin
      entries = Dir.entries(path)
    rescue Errno::ENOENT
      print "ls: #{path}: No such file or directory\n"
      return
    end
    sorted = entries.sort
    general = sorted.reject { |entry| entry.match(/^\./) }
    print general.join("\t") + "\n"
  end
end
