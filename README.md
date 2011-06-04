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

## Using Redis as a key-value store

This example app demonstrates using Redis as a storage engine using the
`redis-store` gem for all Rails caching, demonstrated using fragment
caching. Set up this way, Redis will handle caching for page, action,
fragment, and session caching. You can also use it directly using
`Rails.cache` calls.

* Configuration: `config/application.rb`
* Fragment caching: `app/views/items/index.html.erb`
* Cache expiration: `app/sweepers/item_sweeper.rb`

When an item is added to the database, the fragment is cleared and must
be regenerated the next time the page is viewed. The data is loaded from
the database to do so.

To learn more about this type of caching, see the [Caching with Rails
Guide](http://guides.rubyonrails.org/caching_with_rails.html#fragment-caching).

## Using Redis as a data structure server

A more advanced usage is to use Redis directly to manage data
structures. In this app, we demonstrate adding items to a list. Since
Redis stores strings, we Marshal the items when storing and fetching
from the cache.  The advantage to this approach is the cache can be
updated directly, so the database never needs to be queried. However,
handling updates and deletes is more challenging.

* Configuration: `config/initializers/redis.rb`
* Loading data from Redis: `app/controllers/items_controller.rb`
* Updating Redis list: `app/sweepers/item_sweeper.rb`
* Printing results: `app/views/items/index.html.erb`

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
3. `rake db:migrate`
4. `rails server`

# Project history

1. Set up Gemfile. Add `redis`, `redis-store (>=1.0.0beta5)`. For
   production, include `pg`. Add `thin` for running on Cedar.
2. Set up Redis using redis-store per `config/initializers/redis.rb`.
3. Scaffold items and cache item list using fragment caching. Add cache
   expiration when item is created. Enable caching in development to
   test locally.
4. Add second example of storing items in a Redis list.
