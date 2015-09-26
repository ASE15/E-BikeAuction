class CreateTwitterUsers < ActiveRecord::Migration
  def change
    if(not table_exists? :twitter_users)
		create_table :twitter_users do |t|
		  t.string :uid
		  t.string :name
		  t.string :oauth_token
		  t.string :oauth_secret

		  t.timestamps
		end
    end
  end
end
