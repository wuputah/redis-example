# use provided URL or default to localhost
redis_uri = URI.parse(ENV['REDISTOGO_URL'] || 'redis://127.0.0.1')
# set up a connection to Redis for manual caching
$redis = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
# set up Redis cache store for rails caching
RedisExample::Application.config.cache_store = :redis_store, redis_uri.to_s
RedisExample::Application.config.session_store = :redis_session_store, { :servers => redis_uri.to_s, :expires => 86400 }
