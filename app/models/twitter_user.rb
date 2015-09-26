class TwitterUser < ActiveRecord::Base
=begin
  Parse out data from omni auth
=end
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |twitter_user|
      puts(twitter_user)
      twitter_user.uid = auth.uid
      twitter_user.name = auth.info.name
      twitter_user.provider = auth.provider
      twitter_user.oauth_token = auth.credentials.token
      twitter_user.oauth_secret = auth.credentials.secret
      twitter_user.save!
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
end
