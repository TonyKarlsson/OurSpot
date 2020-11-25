# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
puts "destroyed seeds"


sarmad = User.create(email: "sarmad@ourspot.com", password:"123456")
vasil = User.create(email: "vasil@ourspot.com", password:"123456")
michael = User.create(email: "michael@ourspot.com", password:"123456")
tony = User.create(email: "tony@ourspot.com", password:"123456")

sarmad.friend_request(tony) # Sarmad and Tony are friends
tony.accept_request(sarmad)
vasil.friend_request(michael) # Vasil and Michael are friends
michael.accept_request(vasil)
michael.friend_request(tony) # Michael and Tony are friends
tony.accept_request(michael)


puts "new Users created"
# User.create(email: "blah@ourspot.com", password:"123456")
# User.create(email: "trash@ourspot.com", password:"123456")
# User.create(email: "nothing@ourspot.com", password:"123456")

Chatroom.create(friend1:User.first, friend2:User.last)
puts "new Chatrooms created"

Message.create(chatroom:Chatroom.first, content:"this is a test message", user:User.first)
Message.create(chatroom:Chatroom.first, content:"I am replying to the test message", user:User.last)
puts "new Messages created"

