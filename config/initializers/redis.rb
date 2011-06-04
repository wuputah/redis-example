# use provided URL or default to localhost
redis_uri = URI.parse(ENV['REDISTOGO_URL'] || 'redis://127.0.0.1')
# set up a connection to Redis for manual caching
$redis = Redis.new(:host => redis_uri.host, :port => redis_uri.port, :password => redis_uri.password)
