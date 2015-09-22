class PicturesController < ApplicationController

  def new
    @bike = Bike.find(params[:bike_id])
    for i in 0..4
      @bike.pictures.create();
    end
  end

  def create
    @bike = Bike.find(params[:bike_id])

    params[:pictures]['picture'].each do |a|
      @picture = @bike.pictures.create!(:picture => a, :bike_id => @bike.id)
    end
  end

  def show

  end

end
