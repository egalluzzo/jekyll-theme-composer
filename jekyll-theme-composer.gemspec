# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-composer"
  spec.version       = "0.1.0"
  spec.authors       = ["Eric Galluzzo"]
  spec.email         = ["egalluzzo@gmail.com"]

  spec.summary       = "A theme for creating Jekyll websites for composers, accommodating the needs of concert and game composers."
  spec.homepage      = "https://github.com/egalluzzo/jekyll-theme-composer/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.12"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
end
