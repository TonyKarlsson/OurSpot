class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def add_friend
    user = User.find(params[:user_id])
    authorize user
    current_user.friend_request(user)
    redirect_to users_path
  end

end
