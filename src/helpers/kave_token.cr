module KnucklesChan::Helper
  class KaveToken < Kave::AuthToken
    def self.locate(token : String)
      begin
        payload, header = KnucklesChan::Helper::Jwt.decode(token)
        
        if tryUser = User.current_user(payload)
          return true
        else
          return false
        end
      rescue exception : JWT::VerificationError
        return false
      rescue exception : JWT::ExpiredSignatureError
        return false
      end
    end
  end
end