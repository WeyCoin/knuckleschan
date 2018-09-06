module KnucklesChan::Model
  class User
    include Clear::Model
    self.table = "users"

    with_serial_pkey
    column username : String
    column hex : String
    timestamps
  end
end