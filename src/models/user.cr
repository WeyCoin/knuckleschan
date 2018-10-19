module KnucklesChan
  class User
    include Clear::Model
    self.table = "users"

    with_serial_pkey
    column username : String
    column uuid : String
    column hashed_password : String
    timestamps
  end
end