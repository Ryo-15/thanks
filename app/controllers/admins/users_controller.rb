class Admins::UsersController < ApplicationController
  def index
		@users = User.page(params[:page]).per(10).
  end

	def show
		@user = User.find(params[:id])
  end

	def edit
		@user = User.find(params[:id])
  end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		# redirect_to admins_user_path(@user.id)
  end

		# def search
		# # application controllerで生成した@qを利用して検索する
		# @p_customers = @p.result.page(params[:page]).per(10)
		# render :"admins/customers/index"
		# end

  private
  def user_params
  params.require(:user).permit(:user_id, :name, :kana_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :email,)
  end
end
