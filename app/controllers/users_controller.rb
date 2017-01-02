class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @mentors = @user.mentors
    @fans = @user.fans
    @post_number = @user.topics.count
    @comment_number = @user.comments.count
  end
end
