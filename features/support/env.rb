ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = PatternLibApp

class PatternLibAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  PatternLibAppWorld.new
end
