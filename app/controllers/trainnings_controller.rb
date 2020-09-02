class TrainningsController < ApplicationController
  def new
    @trainning = Trainning.new
  end

  def create
    @trainning = Trainning.new(trainning_params)
    @trainning.user_id = current_user

    if @trainning.save
      redirect to root_path
    else
      render :new
    end
  end

  def index
    @trainnings = Trainning.all
  end

  private

  def trainnings_params
    params.require(:trainng).permit(:address, :duration, :description, :category)
  end
end
