Gem::Specification.new do |spec|
  spec.name        = 'documented'
  spec.version     = '0.0.0'
  spec.date        = '2023-10-24'
  spec.authors     = ["Maedi Prichard"]
  spec.email       = 'maediprichard@gmail.com'

  spec.summary     = "Automated documentation."
  spec.description = "Documentation that's completely automated."
  spec.homepage    = 'https://github.com/greensync/documented'
  spec.license     = 'MPL-2.0'

  spec.files = [
    "lib/accessor.rb",
    "lib/config.rb",
    "lib/documented.rb",
    "lib/renderer.rb",
    "lib/output/gitignore.txt",
    "lib/output/README.md",
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency "parser"

  spec.executables << 'documented'
end
