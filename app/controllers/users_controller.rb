class UsersController < ApplicationController
  def show
    
  end

  def edit
    
  end

  def update
    
  end

	private
  def user_params
    params.require(:user).permit(:email, :name, :kana_name, :password, :last_name, :first_name, :last_name_kana, :first_name_kana)
  end
end
