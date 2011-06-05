RedisExample::Application.config.session_store = :redis_session_store, { :servers => ENV['REDISTOGO_URL'] || 'redis://127.0.0.1', :expires => 86400 }
