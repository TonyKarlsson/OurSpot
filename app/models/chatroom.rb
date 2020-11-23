class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :friend1, class_name: "User"
  belongs_to :friend2, class_name: "User"
end
