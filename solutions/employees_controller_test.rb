require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25)
  end

  def test_index
    get employees_path

    assert_response :ok
    assert_select '#header', 'Listing Employees'
  end

  def test_show
    get employee_path(@employee.id)

    assert_response :ok
    assert_select '#name', @employee.name
    assert_select '#age', @employee.age.to_s
  end

  def test_new
    get new_employee_path

    assert_response :ok
    assert_select '#header', 'New Employee'
  end

  def test_edit
    get edit_employee_path(@employee.id)

    assert_response :ok
    assert_select '#header', 'Editing Employee'
  end

  def test_create__succeed
    assert_difference('Employee.count', 1) do
      employee_params = { name: 'God', age: 25 }
      post employees_path, params: { employee: employee_params }
    end

    assert_redirected_to employee_path(Employee.last)
  end

  def test_create__fail
    assert_no_difference('Employee.count') do
      employee_params = { name: 'April', age: 'ten' }
      post employees_path, params: { employee: employee_params }
    end

    assert_response :ok
    assert_select '#error_explanation ul li', 1
    assert_select('#error_explanation ul li', 'Age is not a number')
  end

  def test_update__succeed
    employee_params = { name: 'Tesla', age: 20 }
    put employee_path(@employee.id), params: { employee: employee_params }

    assert_redirected_to employee_path(@employee.id)
    @employee.reload
    assert_equal 'Tesla', @employee.name
    assert_equal 20, @employee.age
  end

  def test_update__fail
    employee_params = { name: 'Tesla', age: 'ten' }
    put employee_path(@employee.id), params: { employee: employee_params }

    assert_response :ok
    assert_select '#error_explanation ul li', 1
    assert_select('#error_explanation ul li', 'Age is not a number')
  end

  def test_destroy
    assert_difference('Employee.count', -1) do
      delete employee_path(@employee.id)
    end

    assert_redirected_to employees_path
  end
end
