class Trainning < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_one_attached :photo
end
