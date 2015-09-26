class ApplicationController < ActionController::Base
  helper_method :current_twitter_user
 
  def current_twitter_user
    @current_twitter_user ||= TwitterUser.find(session[:twitter_user_id]) if session[:twitter_user_id]
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index

  end


  def owns_bike!
    unless is_own_bike?
      flash[:error] = 'You are not the owner of this bike!'
      redirect_to mybikes_path
    end
  end

  def is_own_bike?
    @bike = Bike.find(params[:bike_id].nil? ? params[:id] : params[:bike_id])
    @bike.user == current_user
  end

  def owns_auction!
    unless is_own_auction?
      flash[:error] = 'You are not the owner of this auction!'
      redirect_to auctions_path
    end
  end

  def is_own_auction?
    @auction = Auction.find(params[:auction_id].nil? ? params[:id] : params[:auction_id])
    @auction.bike.user == current_user
  end
end
