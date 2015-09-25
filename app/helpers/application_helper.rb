module ApplicationHelper

  def is_own_bike(bike)
    bike.user == current_user
  end

  def is_own_auction(auction)
    is_own_bike(auction.bike)
  end
end