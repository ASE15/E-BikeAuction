class TwitterUser < ActiveRecord::Base
=begin
  Parse out data from omni auth
=end
  def self.from_omniauth(auth)
    puts(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.provider = auth.provider
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end
  end

=begin
  Sends tweet
=end
  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    
    client.update(tweet)
  end
  
private
  def auth_params(auth)
  
  end
end
