# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'husl/version'

Gem::Specification.new do |spec|
  spec.name          = "husl"
  spec.version       = Husl::VERSION
  spec.authors       = ["Radu-Bogdan Croitoru"]
  spec.email         = ["croitoruradubogdan@gmail.com"]

  spec.summary       = %q{Human friendly alternative to HSL.}
  spec.description   = %q{HUSL is implemented as a set of functions to convert colors between RGB, HUSL and HUSLp.}
  spec.homepage      = "https://github.com/hsluv/hsluv-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"

  spec.post_install_message = <<-MESSAGE
!    The 'husl' gem has been deprecated and has been replaced by 'hsluv'.
!    See: https://rubygems.org/gems/hsluv
!    And: https://github.com/hsluv/hsluv-ruby
MESSAGE

end

