class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username, { null: false }
      t.string  :hash_password, { null: false }
      t.timestamps
    end
  end
end
