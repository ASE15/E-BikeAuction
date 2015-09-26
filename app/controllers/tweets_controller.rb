class TweetsController < ApplicationController
  def new
  end

=begin
  * Takes data from user to send a tweet
=end
  def create
    current_user.tweet(twitter_params[:message])
  end

=begin
  * Allows :message as property of tweet parameter
=end
  def twitter_params
    params.require(:tweet).permit(:message)
  end
end
