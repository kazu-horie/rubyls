require "rubyls/version"

module Rubyls
  class Error < StandardError; end

  def self.ls(path: '.')
    entries = Dir.entries(path)
    entries.sort!
    entries.reject! { |entry| entry.match(/^\./) }
    "#{entries.join("\t")}\n"
  rescue Errno::ENOENT
    raise ArgumentError.new("ls: #{path}: No such file or directory\n")
  end
end
