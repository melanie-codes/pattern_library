require 'database_cleaner'
DatabaseCleaner.clean_with :truncation # clean once to ensure clean slate
DatabaseCleaner.strategy = :transaction # use transactions by default

Before('@no-txn') do
  DatabaseCleaner.strategy = :truncation
end

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

After('@no-txn') do
  DatabaseCleaner.strategy = :transaction
end
