class BooksController < ApplicationController
before_action :is_matching_user, only: [:edit, :update]
  def show
    @book_new =Book.new
    @book = Book.find(params[:id])
    @user =@book.user
  end

  def index
    @books = Book.all
    @user = current_user
    @book_new = Book.new
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def create
    @user = current_user
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @books=Book.all
      render :index
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def is_matching_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
  
end
