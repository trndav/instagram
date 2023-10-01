class UsersController < ApplicationController
  before_action :set_user
  # Authenticate user to make sure they are signed in
  before_action :authenticate_user!
  def index
  end
  def show
  end
  def follow
    # @user is id of user found in link
    current_user.send_follow_request_to(@user)
    # @user must accept follow request
    @user.accept_follow_request_of(current_user)
    redirect_to user_path(@user)
   end
  def unfollow
    current_user.unfollow(@user)
    redirect_to user_path(@user)
  end
  def accept
    current_user.accept_follow_request_of(@user)
    redirect_to user_path(@user)
   end
  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to user_path(@user)
  end
  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path(@user)
  end
  def set_user
    @user = User.find(params[:id])
  end
end