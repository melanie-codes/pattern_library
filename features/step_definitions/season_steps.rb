Given(/^the system knows about the following seasons:$/) do |table|
  table.hashes.each do |n|
    Season.create name: n[:name]
  end
  expect(Season.count).to eq(2)
end

Then(/^the response is a list containing two seasons$/) do
  result = JSON.parse(last_response.body)
  expect(result['season_collection_count']).to eq(2)
end

When(/^I send the api the following season:$/) do |table|
  table.hashes.each do |n|
    post '/api/season', season: { name: n[:name] }
  end
  expect(Season.count).to eq(1)
end

Given(/^the system knows about the following season:$/) do |table|
  table.hashes.each do |n|
    Season.create name: n[:name]
  end
  expect(Season.count).to eq(1)
end

Given(/^I update the season's name with "(.*?)"$/) do |name|
  season = Season.first
  put "/api/season/#{season.id}", season: { name: name }
end

Given(/^I destroy the season$/) do
  season = Season.first
  delete "/api/season/#{season.id}"
end

Then(/^the client requests the first season$/) do
  season = Season.first
  get "/api/season/#{season.id}"
end
