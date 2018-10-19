require "kemal"
require "dotenv"
require "kave"
require "clear"
require "crypto/bcrypt/password"
require "jwt"
require "json"

require "./initializers/env.cr"
require "./initializers/**"
require "../src/models/**"
require "../src/helpers/**"
require "../src/controllers/**"

require "./db/**"

module KnucklesChan::Application
  # run migrations if needed
  Clear::Migration::Manager.instance.apply_all

end