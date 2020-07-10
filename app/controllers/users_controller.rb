class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    # ログインユーザーの投稿された件数、過去の内容を表示したい
    # @posts = Post.find_by(receiver_id: @user.id)
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
    params.require(:user).permit(:email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image_id)
  end
end
