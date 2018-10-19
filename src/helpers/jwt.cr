module KnucklesChan::Helper
  class Jwt
    def self.encode(uuid : String, username : String)
      payload = { 
        "sub" => uuid, 
        "username" => username, 
        "iat" => Time.now.epoch, 
        "exp" => 14.days.from_now.epoch 
      }
      return JWT.encode(payload, ENV["APP_SECRET"], "HS256")
    end

    def self.decode(token : String)
      return JWT.decode(token, ENV["APP_SECRET"], "HS256")
    end
  end
end