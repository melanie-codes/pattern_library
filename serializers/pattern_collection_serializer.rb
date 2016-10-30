require 'oat'
require 'oat/adapters/hal'

class PatternCollectionSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type "pattern_collection"

    property :pattern_collection_count, item.count
    resource = item.first.designer || item.first.season

    if resource.nil?
      link :self, href: "/api/patterns"
    elsif resource.class.name == "Designer"
      link :self, href: "/api/designer/#{resource.id}/patterns"
    elsif resource.class.name == "Season"
      link :self, href: "/api/season/#{resource.id}/patterns"
    end

    entities :patterns, item, PatternSerializer
  end

end
