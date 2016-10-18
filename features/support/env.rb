ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', './app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'rack'
require 'rack/test'

Capybara.app = PatternLibApp

def app
  Sinatra::Application
end

class PatternLibAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
  include Rack::Test::Methods
end

World do
  PatternLibAppWorld.new
end
