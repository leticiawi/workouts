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
    @markers = User.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('https://br.freepik.com/icones-gratis/mao-com-um-haltere_733843.htm')
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :photo)
    # phone
  end
end
