class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = (current_user.id)
    @book.save
    redirect_to "/books/#{@book.id}"
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  private
  def book_params
    params.permit(:title, :opinion)    
  end
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
end
