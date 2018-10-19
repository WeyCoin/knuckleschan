module KnucklesChan::Helper
  class Jwt
    def self.encode(uuid : String, nonce : String)
      # TODO: implement jti
      payload = {
        "iss" => "WAE",
        "uuid" => uuid, 
        "aud" => [nonce],
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