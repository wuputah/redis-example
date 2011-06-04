# About Redis

Redis is a key-value store similar to memcached. It differs in several
key ways:

* Data can be saved to disk
* Redis can store, manage, and query data structures, such as lists,
  hashes, and sets.
* Redis does not automatically expire data when it is full

Similar to memcached, all keys and any value stored in Redis (including
those in data structures) is a string. To store Ruby objects, values
must be serialized or marshalled.

# Running on Bamboo

    heroku create --stack bamboo-mri-1.9.2
    heroku addons:add redistogo:nano
    git push heroku master

# Running on Cedar

    heroku create --stack cedar
    heroku addons:add redistogo:nano
    git push heroku master

# Running locally

1. Install redis
2. `bundle install`
3. rake db:migrate
4. `gem install foreman`
5. `foreman start`

# Project history

1. Set up Gemfile. Add `redis`, `redis-store (>=1.0.0beta5)`. For
   production, include `pg`. Add `thin` for running on Cedar.
2. Set up Redis using redis-store per `config/initializers/redis.rb`.
3. Scaffold items and cache item list using fragment caching. Add cache
   expiration when item is created. Enable caching in development to
   test locally.
