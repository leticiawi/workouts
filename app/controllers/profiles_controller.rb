class ProfilesController < ApplicationController
  def new
    @profile = User.new
  end

  def create
    @profile = current_user
    if @profile.update(user_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def dashboard
    redirect_to root_path unless user_signed_in?
  end

  # geocoder a partir daqui

  def index
    @user = User.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: { user: user})
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS'}
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address)
    # phone
  end
end
