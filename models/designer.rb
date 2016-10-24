# models/designer.rb
class Designer < ActiveRecord::Base
  has_many :patterns
end
