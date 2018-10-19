module KnucklesChan
  class CreateUsers1
    include Clear::Migration

    def change(dir)
      create_table "users" do |t|
        t.string "uuid", unique: true, null: false
        t.string "username", unique: true, null: false
        t.string "hashed_password", null: false
        t.string "nonce", null: false
        t.timestamps
      end
    end
  end
end