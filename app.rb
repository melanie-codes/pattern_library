#app.rb
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'models/designer'

require_relative 'serializers/designer_serializer'
require_relative 'serializers/designer_collection_serializer'


class PatternLibApp < Sinatra::Base

  # to verify all is working ;-)
  get '/' do
    'Gorby Puff says: "Miaow miaow!"'
  end

  ## API

  # designers
  get '/api/designers' do
    # require 'pry';binding.pry
    designers = Designer.all
    json DesignerCollectionSerializer.new(designers)
  end

  get '/api/designer/:id' do
    designer = Designer.find params[:id]
    json DesignerSerializer.new(designer)
  end

end
