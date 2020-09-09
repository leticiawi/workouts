class ReviewsController < ApplicationController

  def index
    @review = Review.all
    @trainning = Trainning.find(params[:trainning_id])
  end

  def new
    @review = Review.new
    @trainning = Trainning.find(params[:trainning_id])
  end

  def create
    @review = Review.new(review_params)
    @trainning = Trainning.find(params[:trainning_id])
    @review.trainning = @trainning
    @review.user = current_user
    if @review.save
      redirect_to trainning_reviews_path(@trainning)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
