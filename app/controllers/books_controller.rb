class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
     @book = book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
