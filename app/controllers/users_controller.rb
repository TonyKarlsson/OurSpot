class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @users = @users.select {|user|
      !current_user.friends.include?(user) && user != current_user
    }
  end

  def add_friend
    @user = User.find(params[:user_id])
    authorize @user
    current_user.friend_request(@user)
    redirect_to users_path
  end

  def show_profile
    @user = User.find(params[:id])
    authorize @user
  end

  def accept_friend
    @user = User.find(params[:user_id])
    authorize @user
    current_user.accept_request(@user)
    redirect_to users_path
  end

  def reject_friend
    @user = User.find(params[:user_id])
    authorize @user
    current_user.decline_request(@user)
    redirect_to users_path
  end

end
