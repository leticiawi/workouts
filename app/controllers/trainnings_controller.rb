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
    @trainning = Trainning.new(trainnings_params)
    @trainning.user = current_user
    @trainning.category = Category.find(params[:trainning][:category])

    if @trainning.save
      redirect_to trainer_show_path(@trainning)
    else
      render :new
    end
  end

  def edit
    @trainning = Trainning.find(params[:id])
  end

  def update
    @trainning = Trainning.find(params[:id])
    @trainning.category = Category.find(params[:trainning][:category])
    @trainning.update(trainnings_params)
    if @trainning.save
      redirect_to trainer_show_path(@trainning)
    else
      render :edit
    end
  end

  def destroy
    @trainning = Trainning.find(params[:id])
    @trainning.destroy
    redirect_to trainer_index_path
  end

  def trainer_index
    @trainnings = Trainning.where(user: current_user)
  end

  def trainer_show
    @trainning = Trainning.find(params[:id])
  end

  private

  def trainnings_params
    params.require(:trainning).permit(:duration, :address, :description, :photo)
  end
end