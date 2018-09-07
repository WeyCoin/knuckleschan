module KnucklesChan
  class CreateUsers1
    include Clear::Migration

    def change(dir)
      create_table "users" do |t|
        t.string "username", unique: true, null: false
        t.string "hashed_password"
        t.timestamps
      end
    end
  end
end