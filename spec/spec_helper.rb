require "rspec"
require "rspec/collection_matchers"
require "action_mailer"

require File.join(File.dirname(__FILE__), "..", "lib", "actionmailer-html2text")

ActionMailer::Base.view_paths = File.join(File.dirname(__FILE__), "views")
