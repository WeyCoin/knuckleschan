module KnucklesChan::Helper
  class KaveToken < Kave::AuthToken
    def self.locate(token : String)
      begin
        if tryUser = User.current_user(token)
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