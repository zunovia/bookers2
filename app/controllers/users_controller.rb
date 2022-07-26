class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]



  def index
    @users = User.all
    #@user = User.find(params[:id])
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = Book.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.save
      flash[:success]="You have updated user successfully."
    redirect_to user_path(@user.id)
   else
      render :edit
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
end