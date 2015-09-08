$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foxynews/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "foxynews"
  s.version     = Foxynews::VERSION
  s.authors     = ["Adam Bahlke"]
  s.email       = ["adam.bahlke@hitfoxgroup.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Foxynews."
  s.description = "TODO: Description of Foxynews."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
