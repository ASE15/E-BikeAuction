class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.text :name
      t.text :color
      t.integer :weight
      t.text :batterytype
      t.integer :kwh
      t.integer :maxspeed
      t.text :brand
      t.integer :chargingtime
      t.references :owner, index: true

      t.timestamps
    end
  end
end
