class BooksController < ApplicationController
  def new
   @book = Book.new
  end

  # 投稿データの保存(ここがエラーになる、、)
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:success]="Book was successfully created."
    redirect_to book_path(@book.id)
  else
    render :new
  end
  end


  def index
    @books = Book.page(params[:page])
    @book = Book.new


  end

  def show
   @book = Book.find(params[:id])
  end


  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to
  end


  # 投稿データのストロングパラメータ
  private
# ここにidやimage_id
  def book_params
    params.require(:book).permit(:title, :image, :body)
  end
end

