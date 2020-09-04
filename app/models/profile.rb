class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :user, uniqueness: true
end
