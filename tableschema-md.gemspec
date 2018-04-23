
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tableschema/md/version"

Gem::Specification.new do |spec|
  spec.name          = "tableschema-md"
  spec.version       = Tableschema::Md::VERSION
  spec.authors       = ["Kohei Kawasaki"]
  spec.email         = ["mynameiskawasaq@gmail.com"]

  spec.summary       = %q{Simple cli tool to documentation.}
  spec.description   = %q{Simple cli tool to documentation.}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "hanami-cli", "~> 0.2.0"
  spec.add_dependency "tableschema", "~> 1.0"
  spec.add_dependency 'erubis',      '~> 2.7'
end
