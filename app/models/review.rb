class Review < ApplicationRecord
  belongs_to :order
  belongs_to :trainning
end
