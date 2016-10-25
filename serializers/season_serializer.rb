require 'oat'
require 'oat/adapters/hal'

class SeasonSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type "season"

    properties do |props|
      props.name item.name
    end
    link :self, href: "/api/season/#{item.id}"
  end

end
