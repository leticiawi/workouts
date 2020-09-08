class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user, dependent: :destroy
  belongs_to :trainer, class_name: "User", dependent: :destroy
end
