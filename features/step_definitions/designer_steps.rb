Given(/^the system knows about the following designers:$/) do |table|
  table.hashes.each do |name, brand|
    Designer.create name: name, brand: brand
  end
  expect(Designer.count).to eq(2)
end

When(/^the client requests a list of "(.*?)"$/) do |path|
  get path
end
