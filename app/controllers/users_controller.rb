class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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
    params.require(:user)
          .permit(
            :email,
            :password,
            :last_name,
            :first_name,
            :last_name_kana,
            :first_name_kana,
            :profile_image_id,
            :department_id
          )
  end

  # 他の人が編集できないようにする、before_acttionに繋がる
  def correct_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
