lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubyls/version"

Gem::Specification.new do |spec|
  spec.name          = "rubyls"
  spec.version       = Rubyls::VERSION
  spec.authors       = ["Kazuki Horie"]
  spec.email         = ["kazukihorie.jp@gmail.com"]

  spec.summary       = "Simple ls-command."
  spec.description   = "simple ls-command implemented by Ruby"
  spec.homepage      = "https://github.com/kazu-horie/rubyls.git"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kazu-horie/rubyls.git"
  spec.metadata["changelog_uri"] = "https://github.com/kazu-horie/rubyls/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "aruba", "~> 0.14.1"
end
