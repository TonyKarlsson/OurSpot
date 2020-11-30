class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :friend1, class_name: "User"
  belongs_to :friend2, class_name: "User"
  def recipient(user)
    self.friend2 == user ? friend1.username : friend2.username
  end
end
