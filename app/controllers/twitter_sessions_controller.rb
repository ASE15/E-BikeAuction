class TwitterSessionsController < ApplicationController
  def create
    twitter_user = TwitterUser.from_omniauth(env["omniauth.auth"])
    session[:twitter_user_id] = twitter_user.id
    
    if(session[:tweet] != nil)
      tweet = session[:tweet]
      session[:tweet] = nil
      current_twitter_user.tweet(tweet)
      self.destroy()
    else 
	  redirect_to root_path
    end
  end
 
  def destroy
    session[:twitter_user_id] = nil
    redirect_to root_path
  end
end
