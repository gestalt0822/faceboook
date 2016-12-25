class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @mentors = @user.mentors
    @fans = @user.fans
  end
end
