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


# sarmad = User.create(email: "sarmad@ourspot.com", password:"123456", username:"SarmadK")
# vasil = User.create(email: "vasil@ourspot.com", password:"123456", username:"VasilH")
# michael = User.create(email: "michael@ourspot.com", password:"123456", username:"MichaelD")
# tony = User.create(email: "tony@ourspot.com", password:"123456", username:"TonyK")
# dareos = User.create(email: "dareos@ourspot.com", password:"123456", username:"Dareos")
# yaniv = User.create(email: "yaniv@ourspot.com", password:"123456", username:"Yaniv")
# karen = User.create(email: "karen@ourspot.com", password:"123456", username:"karen")
# james = User.create(email: "james@ourspot.com", password:"123456", username:"james")
# harry = User.create(email: "harry@ourspot.com", password:"123456", username:"harry")



# sarmad.friend_request(tony) # Sarmad and Tony are friends
# sarmad.friend_request(michael)
# sarmad.friend_request(vasil)
# michael.accept_request(sarmad)
# vasil.accept_request(sarmad)
# tony.accept_request(sarmad)
# vasil.friend_request(michael) # Vasil and Michael are friends
# vasil.friend_request(tony)
# michael.accept_request(vasil)
# tony.accept_request(vasil)
# michael.friend_request(tony) # Michael and Tony are friends
# tony.accept_request(michael)
# yaniv.friend_request(tony)
# dareos.friend_request(tony)
# tony.accept_request(yaniv)
# tony.accept_request(dareos)


# puts "new Users created"
# # User.create(email: "blah@ourspot.com", password:"123456")
# # User.create(email: "trash@ourspot.com", password:"123456")
# # User.create(email: "nothing@ourspot.com", password:"123456")

# Chatroom.create(friend1:User.find_by(username:"TonyK"), friend2:User.first)
# Chatroom.create(friend1:User.find_by(username:"TonyK"), friend2:User.find_by(username:"MichaelD"))
# Chatroom.create(friend1:User.find_by(username:"TonyK"), friend2:User.find_by(username:"VasilH"))
# Chatroom.create(friend1:User.find_by(username:"TonyK"), friend2:User.find_by(username:"Dareos"))
# Chatroom.create(friend1:User.find_by(username:"TonyK"), friend2:User.find_by(username:"Yaniv"))
# # Chatroom.create(friend1:User.last, friend2:User.find_by(username:"Dareos"))
# # Chatroom.create(friend1:User.last, friend2:User.find_by(username:"Yaniv"))
# puts "new Chatrooms created"

# Message.create(chatroom:Chatroom.first, content:"Dude the pizza here is out of this world!", user:User.first)
# Message.create(chatroom:Chatroom.first, content:"OMG, just tried it now, amazing recommendation!", user:User.find_by(username:"TonyK"))
# Message.create(chatroom:Chatroom.second, content:"This bar has the best Jazz music in town, thank me later", user:User.find_by(username:"TonyK"))
# Message.create(chatroom:Chatroom.second, content:"Thanks bud, having a great time here!", user:User.find_by(username:"MichaelD"))
# Message.create(chatroom:Chatroom.last, content:"The best burger in town, hands down!", user:User.find_by(username:"TonyK"))
# puts "new Messages created"









