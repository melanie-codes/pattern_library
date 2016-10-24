# models/season.rb
class Season < ActiveRecord::Base
  has_many :patterns
end
