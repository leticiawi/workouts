require 'open_weather'
class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :edit]

  def new
    @profile = Profile.new
  end

  def show
    @orders_count = Order.where(trainning_id: params[:id], state: "pending").count
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save!
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def dashboard
    redirect_to root_path unless user_signed_in?
    @profile = Profile.find_by(user: current_user)
    unless @profile.nil?
      @orders_count = Order.where(trainning_id: @profile.user, state: "pending").count

    end
    options = { units: "metric", APPID: "8469665ff40f18c1a4b511bf69e39942" }
    lat,lon = current_user.geocode
    @weather = OpenWeather::Current.geocode(lat, lon, options)
    weather_id = @weather["weather"].first["id"]
    json = File.read(Rails.root.join("lib", "assets", "icons.json"))
    icons = JSON.parse(json)
    @weather_class = icons[weather_id.to_s]["icon"]

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

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :address, :photo, :age, :speciality, :bio, :certifications, :achievments, :user_id)
    # phone
  end
end
