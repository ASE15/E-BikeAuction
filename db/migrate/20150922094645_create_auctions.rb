class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.datetime :endtime

      t.references :bike, index: true

      t.timestamps
    end
  end
end
