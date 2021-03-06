class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_one_attached :photo
  reverse_geocoded_by :longitude, :latitude
  validates :longitude, :latitude, presence: true
end
