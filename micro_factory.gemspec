Gem::Specification.new do |spec|
  spec.name          = "micro_factory"
  spec.version       = '0.0.1'
  spec.authors       = ["Norman Clarke"]
  spec.email         = ["norman@njclarke.com"]
  spec.summary       = "Minimal factories for Active Record."
  spec.description   = "A bare-minimum factory library for Actie Record."
  spec.homepage      = "https://github.com/norman/micro_factory"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.1", ">= 3.1.2"
end
