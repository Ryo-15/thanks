class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(receiver_id: @user.id).page(params[:page]).per(10).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image_id, :department_id)
  end
end
