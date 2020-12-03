module MessageHelper
  def format_friend_list(user)
    user.friends.map do |friend|
      [friend.username, friend.id]
    end
  end

end
