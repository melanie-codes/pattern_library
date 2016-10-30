require 'hyperresource'

class PatternApi
  # HyperResource Api request. In commandline:
  # $ ruby -r "./models/pattern_api.rb" -e "PatternApi.get"
  def self.get
    api = HyperResource.new(root: 'http://localhost:9292/api/designers')

    designers = api.get
    output = designers.body
    puts output
  end
end