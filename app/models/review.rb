class Review < ApplicationRecord
  belongs_to :trainning
  belongs_to :user
  validates :rating, presence: true

  def review_allowed?
  @review = Review.find(user: current_user)
  return true if @review
  end
end
