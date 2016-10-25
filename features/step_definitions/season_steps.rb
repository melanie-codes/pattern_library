Given(/^the system knows about the following seasons:$/) do |table|
  table.hashes.each do |n|
    Season.create name: n[:name]
  end
  expect(Season.count).to eq(2)
end

Then(/^the response is a list containing two seasons$/) do
  result = JSON.parse(last_response.body)
  expect(result["season_collection_count"]).to eq(2)
end
