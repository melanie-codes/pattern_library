# models/pattern.rb
class Pattern < ActiveRecord::Base
  belongs_to :designer
  belongs_to :season
end
