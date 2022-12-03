class UsersController < ApplicationController
  def new
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @post_image = @user.post_images
  end

  def edit
  end

   private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
