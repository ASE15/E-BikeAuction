class PicturesController < ApplicationController

  def create
    @bike = Bike.find(params[:bike_id])

    if params[:picture]
      @picture = @bike.pictures.create(picture_params)
      @picture.save
      redirect_to bike_path(@bike)
    else
      redirect_to bike_path(@bike), :alert => 'Picture cannot be blank!'
    end

    #params[:pictures]['picture'].each do |a|
    #  @picture = @bike.pictures.create!(:picture => a)
    #  @picture.save
    #end

  end

  def show
    @bike = Bike.find(params[:bike_id])
    @picture = Picture.find(params[:id])
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @picture = Picture.find(params[:id])

    @picture.destroy

    redirect_to bike_path(@bike)
  end

  private
  def picture_params
    params.require(:picture).permit(:picture) if params[:picture]
  end

end
