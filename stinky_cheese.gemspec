# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
require 'i18n'
I18n.load_path = Dir['locale/*.yml']
I18n.backend.load_translations
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stinky_cheese/version'

Gem::Specification.new do |spec|
  spec.name          = "stinky_cheese"
  spec.version       = StinkyCheese::VERSION
  spec.authors       = ["Kyle Boss"]
  spec.email         = ["kboss@kyleboss.com"]

  spec.summary       = "Age calculator and formatter (with leap-year support..duh)"
  spec.description   = "Calculates age and formats it appropriately. The kicker: Leap years are accounted for."
  spec.homepage      = "http://www.github.com/Spokeo/stinky_cheese"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "i18n"

  spec.add_runtime_dependency "i18n"
end
