class Trainning < ApplicationRecord
  #belongs_to :category
  belongs_to :user
  has_one :order
  has_many :users, through: :orders
end
