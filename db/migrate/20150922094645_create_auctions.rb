class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.datetime :endtime
      t.reference :bike
      t.references index: true

      t.timestamps
    end
  end
end
