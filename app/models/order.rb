class Order < ApplicationRecord
  belongs_to :user
  belongs_to :trainning
  monetize :amount_cents
end
