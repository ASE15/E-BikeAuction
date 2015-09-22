class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :user
      t.references :auction

      t.timestamps
    end
  end
end
