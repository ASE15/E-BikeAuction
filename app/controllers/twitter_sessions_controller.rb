class TwitterSessionsController < ApplicationController
  def create
    twitter_user = TwitterUser.from_omniauth(env["omniauth.auth"])
    session[:twitter_user_id] = twitter_user.id
    
    if(session[:tweet] != nil)
      tweet = session[:tweet]
      session[:tweet] = nil
      
      begin
		current_twitter_user.tweet(tweet)
	  rescue Twitter::Error::Forbidden => e
		 session[:tweet_error] = true
	  end
	  
      self.destroy()
    else 
	  redirect_to root_path
    end
  end
 
  def destroy
    session[:twitter_user_id] = nil
    
    if(session[:tweet_back])
      redirection = session[:tweet_back]
      session[:tweet_back] = nil
      if(session[:tweet_error])
        session[:tweet_error] = nil
        redirect_to redirection, alert: "You already tweeted about this auction!"
      else
		redirect_to redirection, notice: "You successfully tweeted about this auction!"
	  end
    else
	  redirect_to root_path
	end
  end
end
