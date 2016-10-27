#app.rb
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'models/designer'
require_relative 'models/season'

require_relative 'serializers/designer_serializer'
require_relative 'serializers/designer_collection_serializer'
require_relative 'serializers/season_serializer'
require_relative 'serializers/season_collection_serializer'


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

  post '/api/designer' do
    designer = Designer.create(name: params[:designer][:name], brand: params[:designer][:brand])
    if designer.save
      json DesignerSerializer.new(designer)
    end
  end

  patch '/api/designer/:id' do
    designer = Designer.find params[:id]
    if designer.update_attributes(name: params[:designer][:name], brand: params[:designer][:brand])
      json DesignerSerializer.new(designer)
    end
  end

  delete '/api/designer/:id' do
    designer = Designer.find params[:id]
    if designer.destroy
      {:notice => "designer deleted"}.to_json
    end
  end

  get '/api/seasons' do
    seasons = Season.all
    json SeasonCollectionSerializer.new(seasons)
  end

  get '/api/season/:id' do
    season = Season.find params[:id]
    json SeasonSerializer.new(season)
  end

  post '/api/season' do
    season = Season.create(name: params[:season][:name])
    if season.save
      json SeasonSerializer.new(season)
    end
  end

  patch '/api/season/:id' do
    season = Season.find params[:id]
    if season.update_attributes(name: params[:season][:name])
      json SeasonSerializer.new(season)
    end
  end

  delete '/api/season/:id' do
    season = Season.find params[:id]
    if season.destroy
      {:notice => "season deleted"}.to_json
    end
  end


end
