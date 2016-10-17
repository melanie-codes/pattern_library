Given(/^the system knows about the following designers:$/) do |table|
  table.rows_hash.each do |name, brand|
    FactoryGirl.create :designer, name: name, brand: brand
  end
end
