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
    @books = Book.where(user_id: @user.id)
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end
    
    
  

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def book_params
    params.permit(:title, :opinion)    
  end

end
