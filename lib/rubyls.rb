require "rubyls/version"

module Rubyls
  class Error < StandardError; end

  def self.ls(path: '.')
    entries = Dir.entries(path)
    sorted = entries.sort
    general = sorted.reject { |entry| entry.match(/^\./) }
    print general.join("\t") + "\n"
  rescue Errno::ENOENT
    print "ls: #{path}: No such file or directory\n"
  end
end
