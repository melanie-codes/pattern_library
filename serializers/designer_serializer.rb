require 'oat'
require 'oat/adapters/hal'

# serializer for a single design
class DesignerSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type 'designer'

    properties do |props|
      props.name item.name
      props.brand item.brand
    end
    link :self, href: "/api/designer/#{item.id}"
  end
end
