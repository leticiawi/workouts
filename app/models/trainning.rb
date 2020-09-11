class Trainning < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :reviews
  has_one :profile, through: :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents

  def average_rating
    self.reviews.average(:rating).to_i
  end

  def average_level
    @pending = self.orders.select{o | o.state == "state" }
    @level = @pending.count
  end
end
