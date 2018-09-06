module KnucklesChan
  class CreateUsers1
    include Clear::Migration

    def change(dir)
      create_table "users" do |t|
        t.string "username", unique: true, null: false
        t.string "hex", unique: true, null: false
      end
    end
  end
end