class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
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
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def dashboard
    redirect_to root_path unless user_signed_in?
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :address, :photo, :age, :speciality, :bio, :certifications, :achievments, :user_id)
    # phone
  end
end
