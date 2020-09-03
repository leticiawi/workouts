class PlacesController < ApplicationController
  # def index
  #   @user = User.all

  #   # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
  #   @markers = @flats.geocoded.map do |flat|
  #     {
  #       lat: flat.latitude,
  #       lng: flat.longitude
  #       # infoWindow: render_to_string(partial: "info_window", locals: { user: user})
  #       # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS'}
  #     }
  #   end
  # end
  # def index
  #   @places = Place.order('created_at DESC')
  # end

  def index
    if params[:search].present?
      @locations = Place.near(params[:search], 50, :order => :distance)
    else
      @locations = Place.all
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:success] = "Place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def full_address
    [pais, cidade, rua].compact.join(‘,’)
  end

  def show
    @place = Place.find(params[:id])
  end



  private

  def place_params
    params.require(:place).permit(:title, :address, :visited_by)
  end
end
