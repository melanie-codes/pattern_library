Given(/^the system knows about the following seasons:$/) do |table|
  table.hashes.each do |n|
    Season.create name: n[:name]
  end
  expect(Season.count).to eq(2)
end

Then(/^the response is a list containing two seasons$/) do
  pending # express the regexp above with the code you wish you had
end
