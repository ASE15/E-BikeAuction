class ApplicationController < ActionController::Base
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
    @bike = Bike.find(params[:id].nil? ? params[:bike_id] : params[:id])
    @bike.user == current_user
  end

end