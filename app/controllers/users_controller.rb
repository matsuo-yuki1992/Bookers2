class UsersController < ApplicationController
  
  def index
    @user = current_user
    @book_new=Book.new
    @users=User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
