class Category < ApplicationRecord
  has_many :trainnings, dependent: :destroy
end
