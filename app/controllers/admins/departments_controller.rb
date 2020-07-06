class Admins::DepartmentsController < ApplicationController
  def index
    @department = Department.new
    @departments = Department.all
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admins_departments_path
    else
      @departments = department.all
      render :index
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      redirect_to admins_departments_path, notice: "部署名を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to admins_departments_path, notice: "部署を削除しました"
  end

  private
	def department_params
	params.require(:department).permit(:name)
	end
end
