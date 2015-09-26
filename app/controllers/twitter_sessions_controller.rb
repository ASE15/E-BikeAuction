class TwitterSessionsController < ApplicationController
  def create
    twitter_user = TwitterUser.from_omniauth(env["omniauth.auth"])
    session[:twitter_user_id] = twitter_user.id
    redirect_to root_path
  end
 
  def destroy
    session[:twitter_user_id] = nil
    redirect_to root_path
  end
end
