module KnucklesChan::Controller
  class Api::AuthController
    def initialize(@env : HTTP::Server::Context) end

    def register
      username = @env.params.json["username"].as(String)
      password = @env.params.json["password"].as(String)

      begin
        Clear::SQL.insert("users", 
          {
            username: username,
            hashed_password: Crypto::Bcrypt::Password.create(password, cost: 10).to_s
          }
        ).execute

        payload = { "username" => username, "iat" => Time.now.epoch }
        token = JWT.encode(payload, "SecretKey", "HS256")

        Helper::Res.json({"token" => token})
      rescue exception : PQ::PQError        
        puts "[ERROR]: #{exception.message}"
        # puts e.backtrace if ENV["KEMAL_ENV"] == "development"
        Helper::Res.error("username already taken", 406) if exception.message == "duplicate key value violates unique constraint \"users_username\""
      end
    end

    def login
      username = @env.params.json["username"].as(String)
      password = @env.params.json["password"].as(String)
      
      tryUser = User.query.where({
        username: username
      }).first

      if tryUser
        hs_password = Crypto::Bcrypt::Password.new(tryUser.hashed_password)
        
        if hs_password == password
          payload = { "username" => tryUser.username, "iat" => Time.now.epoch }
          token = JWT.encode(payload, "SecretKey", "HS256")

          Helper::Res.json({"token" => token})
        else
          Helper::Res.json("incorrect password", 204)
        end
      else
        Helper::Res.error("username not found", 402)
      end
    end
  end
end