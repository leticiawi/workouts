class Order < ApplicationRecord
  belongs_to :user
  belongs_to :trainning
  has_one :review
end
