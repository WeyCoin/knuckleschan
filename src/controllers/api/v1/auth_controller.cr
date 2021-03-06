module KnucklesChan::Controller
  class Api::AuthController
    def initialize(@env : HTTP::Server::Context) end

    def register
      begin
        username = @env.params.json["username"].as(String)
        password = @env.params.json["password"].as(String)
        uuid = [Random::Secure.hex(8), Random::Secure.hex(4), Random::Secure.hex(4), Random::Secure.hex(4), Random::Secure.hex(8)].join("-")
        nonce = Random::Secure.hex(10)

        Clear::SQL.insert("users", 
          {
            uuid: uuid,
            nonce: nonce,
            username: username,
            hashed_password: Crypto::Bcrypt::Password.create(password, cost: 10).to_s
          }
        ).execute

        token = KnucklesChan::Helper::Jwt.encode(uuid, nonce)

        Helper::Res.json({
          "token" => token,
          "username" => username
        })
      rescue exception : PQ::PQError        
        puts "[ERROR]: #{exception.message}"
        # puts e.backtrace if ENV["KEMAL_ENV"] == "development"
        Helper::Res.error("username already taken", 406) if exception.message == "duplicate key value violates unique constraint \"users_username\""
      rescue exception : KeyError
        # one if the keys id missing
        puts "[ERROR]: #{exception.message}"
        Helper::Res.error(exception.message, 407)
      end
    end

    def login
      username = @env.params.json["username"].as(String)
      password = @env.params.json["password"].as(String)
      
      tryUser = User.query.find!({username: username})

      if tryUser
        hs_password = Crypto::Bcrypt::Password.new(tryUser.hashed_password)
        
        if hs_password == password
          new_nounce = Random::Secure.hex(10)
          Clear::SQL.update("users").set({"nonce" => new_nounce}).where{id == tryUser.id }.execute

          token = KnucklesChan::Helper::Jwt.encode(tryUser.uuid, new_nounce)

          Helper::Res.json({
            "token" => token,
            "username" => tryUser.username
          })
        else
          Helper::Res.json("incorrect password", 204)
        end
      else
        Helper::Res.error("username not found", 402)
      end
    end

    def logout
      
    end
  end
end