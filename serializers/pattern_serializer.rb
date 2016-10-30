require 'oat'
require 'oat/adapters/hal'

# serializer for a single pattern
class PatternSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type 'pattern'

    properties do |props|
      props.name item.name
      props.description item.description
      props.body item.body
    end
    link :self, href: "/api/pattern/#{item.id}"
  end
end
