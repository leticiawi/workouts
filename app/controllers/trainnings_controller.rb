class TrainningsController < ApplicationController
  def index
    @trainnings = Trainning.geocoded
    if params[:category_id]
      @trainnings = @trainnings.where(category_id: params[:category_id])
    elsif params[:search][:address]
      @trainnings = @trainnings.near(params[:search][:address], 15)

    end
    @markers = @trainnings.geocoded.map do |trainning|
      {
        lat: trainning.latitude,
        lng: trainning.longitude,
        infoWindow: render_to_string(partial: "cards", locals: { trainning: trainning })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS'}
      }
    end
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

  def full_address
    [pais, cidade, rua].compact.join(‘,’)
  end

  private

  def trainnings_params
    params.require(:trainning).permit(:duration, :address, :description, :photo)
  end
end
