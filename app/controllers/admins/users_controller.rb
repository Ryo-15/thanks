class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
    @departments = Department.all
    if params[:department_id]
      @department = @departments.find(params[:department_id])
      @users = @department.users.page(params[:page]).per(10)
      all_users = @department.users
    else
      @users = User.page(params[:page]).per(10)
      all_users = User.all
    end
    @all_users_count = all_users.count
    respond_to do |format|
      format.html do
        #html用の処理を書く
      end
      format.csv do
        #csv用の処理を書く
        send_data render_to_string, filename: "user_index.csv", type: :csv
      end
    end
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
		redirect_to admins_user_path(@user.id)
  end

  private
  def user_params
  params.require(:user).permit(:user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :profile_image_id, :department_id)
  end
end
