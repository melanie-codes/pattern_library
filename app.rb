#app.rb
require 'sinatra/base'

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
