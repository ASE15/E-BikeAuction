class SessionsController < ApplicationController
  def new
  end

=begin
  Create or find user from omniauth and
  set session id
=end
  def create
    params.permit(:oauth_token, :oauth_verifier, :provider)
    user = TwitterUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end
 
=begin
  Log out user by setting session user_id to 
  nil.
=end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
