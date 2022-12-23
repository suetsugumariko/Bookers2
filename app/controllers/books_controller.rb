class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
     @book = Book.find(params[:id])
     @user = current_user

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:alret] = "投稿に失敗しました"
      @books = Book.all
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    end
  end




  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
