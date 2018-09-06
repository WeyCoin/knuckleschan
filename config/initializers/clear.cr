Clear::SQL.init(ENV["DATABASE_URL"])
Clear.logger.level = ::Logger::DEBUG if ENV["KEMAL_ENV"] == "development" #log out the SQL queries