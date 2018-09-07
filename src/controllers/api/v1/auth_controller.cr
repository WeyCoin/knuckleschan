module KnucklesChan::Controller
  class Api::AuthController
    def initialize(@env : HTTP::Server::Context) end

    def register
      username = @env.params.json["username"].as(String)
      password = @env.params.json["password"].as(String)

      puts username
      puts password

      begin
        Clear::SQL.insert("users", 
          {
            username: username,
            password: password
          }).execute

        {left: "up"}.to_json
      rescue exception : PQ::PQError        
        puts "[ERROR]: #{exception.message}"
        # puts e.backtrace if ENV["KEMAL_ENV"] == "development"
        Helper::Res.error("username already taken", 406) if exception.message == "duplicate key value violates unique constraint \"users_username\""
      end
    end

    def login
      {left: "up"}.to_json
    end
  end
end