class TweetsController < ApplicationController
  def create
    puts current_twitter_user
    puts params
    if(current_twitter_user != nil)
        begin 
		  current_twitter_user.tweet(twitter_params)
		rescue Twitter::Error::Forbidden => e
		  session[:tweet_error] = true
		end
	else
      puts params
      session[:tweet] = twitter_params
      session[:tweet_back] = request.env["HTTP_REFERER"]
      
      redirect_to "/auth/twitter", id: "sign_in"
    end
  end

  def twitter_params
    params.require(:message)
  end
end
