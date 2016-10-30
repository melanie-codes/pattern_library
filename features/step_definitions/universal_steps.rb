When(/^the client requests a list of "(.*?)"$/) do |path|
  get path
end

Then(/^the response should contain "(.*?)"$/) do |name|
  result = JSON.parse(last_response.body)
  expect(result['name']).to eq(name)
end
