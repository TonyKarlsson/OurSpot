module MessageHelper
  def format_friend_list(user)
    user.friends.map do |friend|
      [friend.email, friend.id]
    end
  end

end