class Admins::DepartmentsController < ApplicationController
  def index
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
	def department_params
	params.require(:department).permit(:name)
	end
end
