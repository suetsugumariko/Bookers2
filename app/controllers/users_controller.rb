class UsersController < ApplicationController
  def new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
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
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def login_form
  end



   private

  def user_params
    params.require(:user).permit(:name, :image, :email, :password, :password_confirmation)
  end

end
