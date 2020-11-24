# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Chatroom.destroy_all
Message.destroy_all
puts "destroyed seeds"


User.create(email: "test@ourspot.com", password:"123456")
User.create(email: "hello@ourspot.com", password:"123456")
puts "new Users created"
# User.create(email: "blah@ourspot.com", password:"123456")
# User.create(email: "trash@ourspot.com", password:"123456")
# User.create(email: "nothing@ourspot.com", password:"123456")

Chatroom.create(friend1:User.first, friend2:User.last)
puts "new Chatrooms created"

Message.create(chatroom:Chatroom.first, content:"this is a test message", user:User.first)
Message.create(chatroom:Chatroom.first, content:"I am replying to the test message", user:User.last)
puts "new Messages created"

