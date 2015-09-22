class ChangePictureColumnName < ActiveRecord::Migration
  def up
    change_column :pictures, :picture, :string
  end

  def down
    change_column :pictures, :path, :string
  end
end
