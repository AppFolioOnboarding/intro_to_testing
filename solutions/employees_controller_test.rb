require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25, gender: 'F')
  end

  def test_should_get_index
    get employees_path
    assert_response :ok
    assert_select '#header', 'Listing Employees'
  end

  def test_should_get_new
    get new_employee_path
    assert_response :ok
    assert_select '#header', 'New Employee'
  end

  def test_should_create_employee
    assert_difference('Employee.count', 1) do
      employee_params = { age: @employee.age, gender: @employee.gender, name: @employee.name }
      post employees_path, params: { employee: employee_params }
    end

    assert_redirected_to employee_path(Employee.last)
  end

  def test_should_fail_to_create_with_invalid_data
    assert_no_difference('Employee.count') do
      employee_params = { age: 'fifty', gender: @employee.gender, name: @employee.name }
      post employees_path, params: { employee: employee_params }
    end

    assert_response :ok
    assert_select('#error_explanation ul li', 'Age is not a number')
    assert_select 'ul' do
      assert_select 'li', 1
    end
  end

  def test_should_show_employee
    get employee_path(@employee)
    assert_response :ok
    assert_select '#name', text: @employee.name
    assert_select '#gender', text: @employee.gender
    assert_select '#age', text: @employee.age.to_s
  end

  def test_should_get_edit
    get edit_employee_path(@employee)
    assert_response :ok
    assert_select '#header', 'Editing Employee'
  end

  def test_should_update_employee
    employee_params = { age: @employee.age + 1, gender: @employee.gender, name: @employee.name }
    patch employee_path(@employee), params: { employee: employee_params }
    assert_redirected_to employee_path(@employee)
  end

  def test_should_destroy_employee
    assert_difference('Employee.count', -1) do
      delete employee_path(@employee)
    end

    assert_redirected_to employees_path
  end
end
