
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pronto/prettier/version"

Gem::Specification.new do |spec|
  spec.name          = "pronto-prettier"
  spec.version       = Pronto::PrettierVersion::VERSION
  spec.authors       = ["Alireza Bashiri"]
  spec.email         = ["azbshiri@gmail.com"]

  spec.summary       = %q{Pronto runner for checking if the given files are formatted using Prettier}
  spec.homepage      = "https://github.com/oozou/pronto-prettier"
  spec.license       = "MIT"


  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency('pronto', '~> 0.10.0')
end
