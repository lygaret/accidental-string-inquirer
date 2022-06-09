Gem::Specification.new do |spec|
  spec.name          = "string-inquirer"
  spec.version       = "0.0.1"
  spec.authors       = ["Jon Raphaelson"]
  spec.email         = ["jon@accidental.cc"]

  spec.summary       = %q{simple mixin for string equality predicates}
  spec.license       = "MIT"

  spec.files         = Dir.glob("**/*.rb", base: __dir__)
  spec.require_paths = ["."]
end
