class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :path
      t.references :bike, index: true

      t.timestamps
    end
  end
end
