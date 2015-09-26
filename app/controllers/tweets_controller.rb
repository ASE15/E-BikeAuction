class TweetsController < ApplicationController
  def create
    current_twitter_user.tweet(twitter_params[:message])
  end

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
