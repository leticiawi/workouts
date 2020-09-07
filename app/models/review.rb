class Review < ApplicationRecord
  belongs_to :trainning
  belongs_to :user
  validates :rating, presence: true
end
