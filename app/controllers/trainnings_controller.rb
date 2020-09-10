class TrainningsController < ApplicationController
  before_action :set_trainning, only: [:show, :update, :edit]

  def index
    @profile = current_user.profile
    @trainnings = Trainning.geocoded.where(category_id: params[:category_id], active: true)
    @category_id = params[:category_id]
    if params[:category_id]
      User.where("user != current_use AND category_id: @category_id ")
      @trainnings
    elsif params[:search]
      @trainnings = @trainnings.near(params[:search][:address], 15)

    end
    @markers = @trainnings.geocoded.map do |trainning|
      {
        lat: trainning.latitude,
        lng: trainning.longitude,
        infoWindow: render_to_string(partial: "card_map", locals: { trainning: trainning })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS'}
      }
    end
  end

  def show
    @trainning = Trainning.find(params[:id])
    @orders_count = Order.where(trainning: @trainning, state: "pending").count
    @profile = @trainning.user.profile
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

    if @trainning.update(trainnings_params)
      redirect_to trainer_show_path(@trainning)
    else
      render :edit
    end
  end

  def destroy
    @trainning = Trainning.find(params[:id])
    @trainning.update(active: false)
    redirect_to trainer_index_path
  end

  def trainer_index
    @trainnings = Trainning.where(user: current_user)
  end

  def trainer_show
    @trainning = Trainning.find(params[:id])
    @orders_count = Order.where(trainning_id: params[:id], state: "pending").count
    @profile = current_user.profile
  end

  def full_address
    [pais, cidade, rua].compact.join(‘,’)
  end

  private

  def set_trainning
    @trainning = Trainning.find(params[:id])
  end

  def trainnings_params
    params.require(:trainning).permit(:duration, :address, :description, :photo, :price_cents)
  end
end
