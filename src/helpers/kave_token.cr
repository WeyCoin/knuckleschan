module KnucklesChan::Helper
  class KaveToken < Kave::AuthToken
    def self.locate(token : String)
      begin
        payload, header = JWT.decode(token, "SecretKey", "HS256")
        
        puts payload
        puts header

        return true
      rescue exception : JWT::VerificationError
        return false
      end
    end
  end
end