class CategoriesController < ApplicationController
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
