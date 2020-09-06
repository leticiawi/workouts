class Review < ApplicationRecord
  belongs_to :order
  belongs_to :trainning
  validates :rating, presence: true
end
