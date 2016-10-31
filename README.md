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

Populate the DB:
```
rake db:seed
```

To get started, run:

```
rackup
```

visit http://localhost:9292 to ensure app is working correctly

To use HyperResource:

1) Leave server running and type the following commands on the command line
2) `irb`
3) `require 'hyperresource'`
4) `api = HyperResource.new(root: 'http://localhost:9292/api/designers')`
5) `api.designers.first.patterns.body`
6) `api = HyperResource.new(root: 'http://localhost:9292/api/seasons')`
7) `api.seasons.first.patterns.body`
