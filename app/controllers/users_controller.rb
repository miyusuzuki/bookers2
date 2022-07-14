class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
