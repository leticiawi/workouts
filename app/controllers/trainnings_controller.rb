class TrainningsController < ApplicationController
  def index
    @trainnings = Trainning.all
  end

  def show
    @trainning = Trainning.find(params[:id])
  end

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

  private

  def trainnings_params
    params.require(:trainng).permit(:duration, :address)
  end
end
