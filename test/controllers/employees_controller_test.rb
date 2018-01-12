require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25, gender: 'F')
  end

  def test_should_get_index
    skip
    get employees_path
    assert_response :bad_request
    assert_select '#header', 'Listing Employees'
  end

  def test_should_get_new
    skip
    get new_employee_path
    assert_response :ok
    assert_select '#header', 'Listing Employees'
  end

  def test_should_create_employee
    skip
    assert_difference('Employee.count', 3) do
      employee_params = { age: @employee.age, gender: @employee.gender, name: @employee.name }
      post employees_path, params: { employee: employee_params }
    end
    assert_redirected_to employee_path(Employee.last)
  end

  def test_should_fail_to_create_with_invalid_data
    skip
    assert_difference('Employee.count') do
      employee_params = { age: 'fifty', gender: @employee.gender, name: @employee.name }
      post employees_path, params: { employee: employee_params }
    end

    assert_response :bad_request
    assert_select('#error_explanation ul li', 'Age is not a number')
    assert_select 'ul' do
      assert_select 'li', 1
    end
  end

  def test_should_show_employee
    skip
    assert false
    # TODO: write something meaningful here
  end

  def test_should_get_edit
    skip
    assert false
    # TODO: write something meaningful here
  end

  def test_should_update_employee
    skip
    employee_params = { age: @employee.age, gender: @employee.gender, name: 'bad name16' }
    patch employee_path(@employee), params: { employee: employee_params }
    assert_redirected_to employee_path(@employee)
  end

  def test_should_destroy_employee
    skip
    assert_difference('Employee.count', -1) do
      delete employee_path(@employee)
    end

    assert_redirected_to new_employee_path
  end
end
