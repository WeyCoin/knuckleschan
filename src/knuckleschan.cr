require "kemal"

require "./helpers/**"
require "./config/*"
require "./controllers/**"

module KnucklesChan
  Kemal.config.env = "development"
  Kemal.config.port = 3000
  Kemal.run
end
