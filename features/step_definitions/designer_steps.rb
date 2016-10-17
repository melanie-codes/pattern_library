Given(/^the system knows about the following designers:$/) do |table|
  table.rows_hash.each do |name, brand|
    Designer.create, name: name, brand: brand
  end
end
