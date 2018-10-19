module KnucklesChan::Helper
  class KaveToken < Kave::AuthToken
    def self.locate(token : String)
      begin
        payload, header = JWT.decode(token, "SecretKey", "HS256")
        
        tryUser = User.query.where({
          uuid: payload["sub"],
          username: payload["username"]
        }).first

        if tryUser
          return true
        else
          return false
        end
      rescue exception : JWT::VerificationError
        return false
      end
    end
  end
end