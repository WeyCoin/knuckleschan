module KnucklesChan
  class User
    include Clear::Model
    self.table = "users"

    with_serial_pkey
    column username : String
    column uuid : String
    column nonce : String
    column hashed_password : String
    timestamps

    def self.current_user(payload)
      return User.query.find({
        uuid: payload["uuid"],
        nonce: payload["aud"][0]
      })
    end
  end
end