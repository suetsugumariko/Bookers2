class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
  end

  def show
     @book = book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    if @new_book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@new_book)
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
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
