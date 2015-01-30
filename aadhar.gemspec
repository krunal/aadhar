$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "aadhar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "aadhar"
  s.version     = Aadhar::VERSION
  s.authors     = ["Krunal"]
  s.email       = ["krunal.shah@hotmail.com"]
  s.homepage    = "https://rubygems.org/gems/aadhar"
  s.summary     = "Token based authentication"
  s.description = "Token based authentication. To support backend authentication for ios, android, angular, ember etc..."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 4.2.0', '>= 4.2.0'
  s.add_dependency 'bcrypt', '~> 3.1', '>= 3.1.10'

  s.add_development_dependency "mysql2", '~> 0.3', '>= 0.3.17'
  
end
