# Pattern Library

This API is a library for kniting patterns. Clients can find a designer, pattern season and related patterns.

# Required software

* Ruby
* PostgreSQL

# Development Documentation

This project is made in Sinatra.

First install  necessary gems:
```
bundle install
```

To get started, run:

```
rackup
```

To create migrations:
```
rake db:create_migration NAME=create_#{NAME OF MODEL}
```
