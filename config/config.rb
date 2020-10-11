require "dry-configurable"

module BlogBackend
  extend Dry::Configurable

  setting :postgres do
    setting :database
    setting :host
    setting :password
    setting :username
  end

  setting :redis do
    setting :uri
  end
end

BlogBackend.configure do |config|
  config.postgres.database = ENV.fetch("DATABASE_NAME") { "ewallet_backend" }
  config.postgres.host = ENV.fetch("DATABASE_HOST")
  config.postgres.password = ENV.fetch("DATABASE_PASSWORD")
  config.postgres.username = ENV.fetch("DATABASE_USERNAME")

  config.redis.uri = ENV.fetch("REDIS_URI")
end

