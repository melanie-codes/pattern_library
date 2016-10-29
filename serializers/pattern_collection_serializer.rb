require 'oat'
require 'oat/adapters/hal'

class PatternCollectionSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type "pattern_collection"
    resource = item.first.designer || item.first.season
    property :pattern_collection_count, item.count

    link :self, href: "/api/designer/#{resource.id}/patterns"

    entities :patterns, item, PatternSerializer
  end

end
