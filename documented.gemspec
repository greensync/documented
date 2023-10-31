Gem::Specification.new do |spec|
  spec.name        = 'documented'
  spec.version     = '0.1.1'
  spec.date        = '2023-10-24'
  spec.authors     = ["Maedi Prichard"]
  spec.email       = 'maediprichard@gmail.com'

  spec.summary     = "Automated documentation."
  spec.description = "Documentation that's completely automated."
  spec.homepage    = 'https://github.com/greensync/documented'
  spec.license     = 'MPL-2.0'

  spec.files = [
    "lib/config.rb",
    "lib/documented.rb",
    "lib/renderer.rb",
    "lib/rewriter.rb",
    "lib/tracer.rb",
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop"

  spec.executables << 'documented'
end
