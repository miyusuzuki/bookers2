class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to "/books/#{@book.id}"
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
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
