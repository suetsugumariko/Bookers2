class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book, only: [:edit, :update]

  def new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

 def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'Signed in successfully'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :index
    end
 end


  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully'
      redirect_to user_path(@user.id)
     else
      render :edit
     end
  end






  def login_form
  end



   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_book
    @user = User.find(params[:id])
    redirect_to(users_path) unless @user == current_user
  end

end
