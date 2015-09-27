class AddProviderToTwitterUser < ActiveRecord::Migration
  def change
    add_column :twitter_users, :provider, :string
  end
end
