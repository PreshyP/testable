require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url, as: :json
    assert_response :success
  end

  test "should create employee" do
   # puts "Number of Employees Before: #{Employee.count}"
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { hiredate: @employee.hiredate, lastname: @employee.lastname, name: @employee.name, salary: @employee.salary } }, as: :json
    end
    puts "Number of Employees After: #{Employee.count}"
  
    assert_response :created
  end

  test "should show employee" do
    get employee_url(@employee), as: :json
    assert_response :success
  end

  test "should update employee with valid salary" do
    puts "Original Employee: #{@employee.attributes}"
    patch employee_url(@employee), params: { employee: { salary: 50000 } }, as: :json
    assert_response :success
  
    @employee.reload
    assert_equal "Updated Name", @employee.name
    assert_equal 50000, @employee.salary
    puts "Updated Employee: #{@employee.attributes}"
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee), as: :json
    end

    assert_response :no_content
  end
end
