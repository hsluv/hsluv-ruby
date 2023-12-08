# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'hsluv'
  spec.version       = '1.0.2'
  spec.authors       = ['Radu-Bogdan Croitoru', 'HSLuv Contributors']
  spec.email         = ['croitoruradubogdan@gmail.com', 'hsluvcontributors@gmail.com']

  spec.summary       = 'Human friendly alternative to HSL.'
  spec.description   = 'HSLuv is implemented as a set of functions to convert colors between RGB, HSLuv and HPLuv.'
  spec.homepage      = 'https://github.com/hsluv/hsluv-ruby'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
