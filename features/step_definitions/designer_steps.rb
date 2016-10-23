Given(/^the system knows about the following designers:$/) do |table|
  table.hashes.each do |n|
    Designer.create name: n[:name], brand: n[:brand]
  end
  expect(Designer.count).to eq(2)
end

When(/^the client requests a list of "(.*?)"$/) do |path|
  get path
end

Then(/^the response is a list containing two designers$/) do
  result = JSON.parse(last_response.body)
  expect(result["designer_collection_count"]).to eq(2)
end

Then(/^the client requests the first designer through "(.*?)"$/) do |path|
  get path
end

Then(/^the response should contain "(.*?)"$/) do |name|
  result = JSON.parse(last_response.body)
  expect(result["name"]).to eq(name)
end
