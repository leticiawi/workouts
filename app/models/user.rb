class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :trainnings, through: :orders
  has_many :sold_trainnings, class_name: "Trainning", dependent: :destroy
  has_many :reviews
  validates :address, :name, presence: true, on: :update
  has_one_attached :photo
  has_one :profile, dependent: :destroy
  # phone

  # geocoder info
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
