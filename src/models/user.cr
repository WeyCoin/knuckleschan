module KnucklesChan
  class User
    include Clear::Model
    self.table = "users"

    with_serial_pkey
    column username : String
    column uuid : String
    column hashed_password : String
    timestamps

    def self.current_user(token : String)
      payload, header = KnucklesChan::Helper::Jwt.decode(token)
      return User.query.where({
        uuid: payload["sub"],
        username: payload["username"]
      }).first
    end
  end
end