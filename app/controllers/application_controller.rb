class ApplicationController < ActionController::Base

  private
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

  # def set_search
  #   #以下は検索に使うときの記述（変数やモデル名は変更してもいいですが
  #   #".ransack(params[:q])"はそのままで使用します。）
  #   @search = User.ransack(params[:q])
  #   #以下は検索したものを表示する時に使う記述(一番シンプルで基本の形です)
  #   @users = @search.result
  # end
end
