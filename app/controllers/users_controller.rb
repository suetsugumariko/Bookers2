class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def login_form
  end



   private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
