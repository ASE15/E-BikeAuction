class TweetsController < ApplicationController
  def create
    puts current_twitter_user
    puts params
    if(current_twitter_user != nil)
		current_twitter_user.tweet(twitter_params)
	else
      puts "Don't do that!"
      puts params
      session[:tweet] = twitter_params
      redirect_to "/auth/twitter", id: "sign_in"
    end
  end

  def twitter_params
    params.require(:message)
  end
end
