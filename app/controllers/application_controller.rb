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
end
