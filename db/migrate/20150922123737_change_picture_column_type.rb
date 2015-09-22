class ChangePictureColumnType < ActiveRecord::Migration
  def up
    change_column :pictures, :path, :string
  end

  def down
    change_column :pictures, :path, :text
  end
end
