class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :trainnings, through: :orders
  has_many :sold_trainnings, class_name: "Trainning", dependent: :destroy
  validates :address, :name, presence: true, on: :update
  # phone
end
