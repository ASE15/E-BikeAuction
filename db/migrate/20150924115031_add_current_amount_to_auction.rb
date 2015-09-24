class AddCurrentAmountToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :current_amount, :Integer
  end
end
