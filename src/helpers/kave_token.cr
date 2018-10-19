module KnucklesChan::Helper
  class KaveToken < Kave::AuthToken
    def self.locate(token : String)
      begin
        payload, header = KnucklesChan::Helper::Jwt.decode(token)
        
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