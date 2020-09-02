class TrainningsController < ApplicationController
  def index
    @trainnings = Trainning.all
  end

  def show
    @trainning = Trainning.find(params[:id])
  end

  def new
    if current_user.trainer == true
    @trainning = Trainning.new
  else
    flash[:notice] = 'Vc nao pode acessar essa pagina!'
    redirect_to root_path
  end
end

  def create
    @trainning = Trainning.new(trainning_params)
    @trainning.user_id = current_user

    if @trainning.save
      redirect to @trainning
    else
      render :new
    end
  end

  private

  def trainnings_params
    params.require(:trainning).permit(:duration, :address)
  end
end
