Given(/^the designer has the following patterns:$/) do |table|
  designer = Designer.first
  table.hashes.each do |n|
    Pattern.create name: n[:name], description: n[:description], designer: designer
  end
  expect(Pattern.count).to eq(3)
end

When(/^I call for the designer's patterns$/) do
  designer = Designer.first
  get "/api/designer/#{designer.id}/patterns"
end

Then(/^the response should contain the three patterns$/) do
  result = JSON.parse(last_response.body)
  expect(result["pattern_collection_count"]).to eq(3)
end

Given(/^the season knows the following patterns:$/) do |table|
  season = Season.first
  table.hashes.each do |n|
    Pattern.create name: n[:name], description: n[:description], season: season
  end
  expect(Pattern.count).to eq(3)
end

When(/^I call for the seasons patterns$/) do
  season = Season.first
  get "/api/season/#{season.id}/patterns"
end
