class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show update destroy ]

  
  def new
    @employee = Employee.new
  end

  # GET /employees
  def index
    @employees = Employee.all

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
     # redirect_to @employee, notice: 'Employee was successfully created.' # validation if successfully
    else
      render json: @employee.errors, status: :unprocessable_entity
      #render :new #validation if failed
    end
  end

  # PATCH/PUT /employees/1
  def update
    puts "Received Parameters: #{params.inspect}"
    if @employee.update(employee_params)
      puts "Employee Updated: #{@employee.attributes}"
      render json: @employee
    else
      puts "Update Errors: #{employee.errors.full_messages}"
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :lastname, :hiredate, :salary)
    end
end
