class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  #sign_up時の登録情報追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :department_id, :pofile_image_id])
  end

  #sign in後のredirect先変更
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admins_top_path
      when User
        posts_path
    end
  end
  #sign out後のredirect先変更
  def after_sign_out_path_for(resource)
      root_path
  end

  # 検索
  def search
    @search = User.ransack(params[:q])
    # @users = @search.result(distinct: true)
  end
end
