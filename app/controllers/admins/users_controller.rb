class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :search

  def index
    @departments = Department.all
    @users =
      if params[:department_id]
        @department = @departments.find(params[:department_id])
        all_users = @department.users.with_deleted
        all_users.page(params[:page]).per(10)
      elsif params[:q]
        all_users = @search.result.with_deleted.page(params[:page]).per(10)
      else
        all_users = User.all.with_deleted
        User.with_deleted.page(params[:page]).per(10)
      end
    @all_users_count = all_users.count
    respond_to do |format|
      format.html do
        # html用の処理を書く
      end
      format.csv do
        # csv用の処理を書く
        @users = User.all
        send_data render_to_string, filename: "user_index-#{
          Time.zone.now.strftime("%Y%m%d %H%M")
        }.csv", type: :csv
      end
    end
  end

  def import
    User.import(params[:file])
    redirect_to admins_users_path
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  def edit
    @user = User.with_deleted.find(params[:id])
  end

  def update
    @user = User.with_deleted.find(params[:id])
    if params[:user][:deleted_at] == "NOTNULL"
      params[:user][:deleted_at] = Date.today
    else
      params[:user][:deleted_at] = nil
    end
    @user.update(user_params)
    redirect_to admins_user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(
      :user_id,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :email,
      :password,
      :profile_image,
      :department_id,
      :deleted_at
    )
  end
end
