class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def checkout
    @trainning = Trainning.find(params[:trainning_id].to_i)

  end

  def show
  end
end
