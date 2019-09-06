$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "actionmailer-html2text/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "actionmailer-html2text"
  s.version     = ActionMailer::Html2Text::VERSION
  s.authors     = ["Jevon Wright"]
  s.email       = ["jevon@powershop.co.nz"]
  s.homepage    = "https://github.com/soundasleep/actionmailer-html2text"
  s.summary     = "Add plain text automatically to HTML emails."
  s.description = "Automatically add plain text parts into HTML emails sent by ActionMailer."
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "LICENSE.md", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "html2text", "~> 0.3"
  s.add_dependency "actionmailer"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-collection_matchers"
  s.add_development_dependency "colorize"
  s.add_development_dependency "rake"
end
