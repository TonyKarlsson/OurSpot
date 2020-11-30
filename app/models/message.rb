class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  has_many_attached :photos

  reverse_geocoded_by :longitude, :latitude

end
