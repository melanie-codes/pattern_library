require 'oat'
require 'oat/adapters/hal'

# serializer for a single season
class SeasonSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type 'season'

    properties do |props|
      props.name item.name
    end
    link :self, href: "/api/season/#{item.id}"
    link :patterns, href: "/api/season/#{item.id}/patterns"
  end
end
