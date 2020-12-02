class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :messages
  has_many :chatrooms_as_friend1, source: :chatrooms, foreign_key: :friend1_id
  has_many :chatrooms_as_friend2, source: :chatrooms, foreign_key: :friend2_id
  has_friendship
  validates :username, presence: true
  has_one_attached :photo
end
