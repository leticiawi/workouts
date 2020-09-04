class PlacesController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  def index
    @places = Place.all

    @markers = @places.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url('icon.png')
      }
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to dashboard_path
    # preciso de um botao que salve este endereco e redirecione para o dashboard (que tera o endereco ja definido)
  end

  private

  def place_params
    params.require(:place).permit(:address)
  end
end
