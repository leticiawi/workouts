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

  def edit
    @profile = current_user
  end

  def update
    @profile = current_user
    if @profile.update(user_params)
      redirect_to profile_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address)
    # phone
  end
end
