class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:success] = "Employee created successfully"
      redirect_to @employee
    else
      flash.now[:danger] = "An error has occured while creating employee"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = "Employee updated successfully"
      redirect_to @employee
    else
      flash.now[:danger] = "An error has occured while updating employee"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.present?
      @employee.destroy
      flash[:success] = "Employee deleted successfully"
    else
      flash[:danger] = "An error has occured while deleting employee"
    end
    redirect_to root_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :job, :department, :salary, :hire_date)
  end
end
