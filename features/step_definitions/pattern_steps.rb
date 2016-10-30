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
  expect(result['pattern_collection_count']).to eq(3)
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

Given(/^the system knows about the following patterns:$/) do |table|
  table.hashes.each do |n|
    Pattern.create name: n[:name], description: n[:description]
  end
end

Then(/^the response is a list containing three patterns$/) do
  result = JSON.parse(last_response.body)
  expect(result['pattern_collection_count']).to eq(3)
end

When(/^I send the api the following pattern:$/) do |table|
  table.hashes.each do |n|
    post '/api/pattern', pattern: { name: n[:name], description: n[:description] }
  end
end

Given(/^I update the patterns's name with "(.*?)"$/) do |name|
  pattern = Pattern.first
  put "/api/pattern/#{pattern.id}", pattern: { name: name }
end

Given(/^I destroy the pattern$/) do
  pattern = Pattern.first
  delete "/api/pattern/#{pattern.id}"
end

Then(/^the client requests the first pattern$/) do
  pattern = Pattern.first
  get "/api/pattern/#{pattern.id}"
end
