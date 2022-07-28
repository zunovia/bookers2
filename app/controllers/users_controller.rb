class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]



  def index
    @users = User.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:success]="You have updated user successfully."
    redirect_to user_path(@user.id)
   else
      render :edit
   end
  end

  def new
   @book = Book.new
  end


  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
end