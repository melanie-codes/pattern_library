#app.rb
require 'sinatra/base'
require 'sinatra/activerecord'

require_relative 'models/designer'

class PatternLibApp < Sinatra::Base

  # to verify all is working ;-)
  get '/' do
    'Gorby Puff says: "Miaow miaow!"'
  end

  # designers
  get '/designers' do
    @designers = Designer.all
  end

end
