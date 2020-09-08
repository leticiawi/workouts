class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
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
    @profile = Profile.find(params[:id])
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(profile)
    else
      render :edit
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
    @profile = Profile.find_by(user: current_user)
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :address, :photo, :age, :speciality, :bio, :certifications, :achievments, :user_id)
    # phone
  end
end
