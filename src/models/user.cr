module KnucklesChan::Model
  class User
    include Clear::Model
    self.table = "users"

    with_serial_pkey
    column username : String
    column hashed_password : String?
    timestamps

    def password=(x)
      self.encrypted_password = Encryptor.hash(x)
    end
  end
end