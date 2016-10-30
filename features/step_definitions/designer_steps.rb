Given(/^the system knows about the following designers:$/) do |table|
  table.hashes.each do |n|
    Designer.create name: n[:name], brand: n[:brand]
  end
  expect(Designer.count).to eq(2)
end

Then(/^the response is a list containing two designers$/) do
  result = JSON.parse(last_response.body)
  expect(result["designer_collection_count"]).to eq(2)
end

Then(/^the client requests the first designer$/) do
  designer = Designer.first
  get "/api/designer/#{designer.id}"
end

When(/^I send the api the following designer:$/) do |table|
  table.hashes.each do |n|
    post "/api/designer", {designer: {name: n[:name], brand: n[:brand] }}
  end
  expect(Designer.count).to eq(1)
end

Given(/^the system knows about the following designer:$/) do |table|
  table.hashes.each do |n|
    Designer.create name: n[:name], brand: n[:brand]
  end
  expect(Designer.count).to eq(1)
end

Given(/^I update the designer's name with "(.*?)"$/) do |name|
  designer = Designer.first
  put "/api/designer/#{designer.id}", {designer: {name: name}}
end

Given(/^I destroy the designer$/) do
  designer = Designer.first
  delete "/api/designer/#{designer.id}"
end

Then(/^the response should be "(.*?)"$/) do |response|
  result = JSON.parse(last_response.body)
  expect(result["notice"]).to eq(response)
end
