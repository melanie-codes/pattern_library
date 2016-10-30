require 'oat'
require 'oat/adapters/hal'

# serializer for a collection of seasons
class SeasonCollectionSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type 'season_collection'
    property :season_collection_count, item.count
    link :self, href: '/api/designers'

    entities :seasons, item, SeasonSerializer
  end
end
