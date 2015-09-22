class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username

      t.timestamps
    end
  end
  def change
    add_index :username, unique: true
  end
end
