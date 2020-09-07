class Trainning < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :reviews
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
