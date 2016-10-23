require 'oat'
require 'oat/adapters/hal'

class DesignerCollectionSerializer < Oat::Serializer
  adapter Oat::Adapters::HAL

  schema do
    type "designer_collection"
    property :designer_collection_count, item.count
    link :self, href: "/api/designers"

    entities :designers, item, DesignerSerializer
  end

end
