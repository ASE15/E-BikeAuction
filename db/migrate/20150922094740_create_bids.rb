class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.reference :user
      t.reference :auction

      t.timestamps
    end
  end
end
