class BooksController < ApplicationController
  def new
  end

  def show
  end

  def index
    @books = Book.all
    @user = current_user
    
  end

  def edit
  end
  
  
end
