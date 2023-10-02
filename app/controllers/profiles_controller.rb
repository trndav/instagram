class ProfilesController < ApplicationController
  def index
    @users = users 
  end
  def users
    # Match search query to username
    query = User.ransack(username_cont: search_query)
    # @users are defined here
    @users = query.result(distinct: true)
  end
  private
  def search_query
    params[:query]
  end
end