class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
