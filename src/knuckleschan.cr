require "kemal"
require "dotenv"

require "./helpers/**"
require "./config/*"
require "./controllers/**"

module KnucklesChan
  # for development we can .env
  # in production we use ram
  if File.exists?(".env")
    Dotenv.load
  end

  Kemal.config.env = ENV["KEMAL_ENV"]
  Kemal.config.port = ENV["PORT"].to_i
  Kemal.run
end
