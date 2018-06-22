require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25)
  end

  def test_index
    get employees_path

    assert_response :ok
    assert_select '#header', 'Employees'
  end

  def test_show
    get employee_path(@employee.id)

    # TODO: finish the assertion
  end

  def test_new
    get new_employee_path

    # TODO: finish the assertion
  end

  def test_edit
    get edit_employee_path(@employee.id)

    # TODO: finish the assertion
  end

  def test_create__succeed
    assert_difference('Employee.count', 1) do
      employee_params = { name: 'God', age: 25 }
      post employees_path, params: { employee: employee_params }
    end

    assert_redirected_to employee_path(Employee.last)
    assert_equal 'Employee was successfully created.', flash[:notice]
  end

  def test_create__fail
    assert_no_difference('Employee.count') do
      employee_params = { name: 'April', age: 'ten' }
      post employees_path, params: { employee: employee_params }
    end

    assert_response :ok
    assert_select '#age-error', 'Age is not a number'
  end

  def test_update__succeed
    employee_params = { name: 'Tesla', age: 20 }
    put employee_path(@employee.id), params: { employee: employee_params }

    # TODO: finish the assertion
  end

  def test_update__fail
    # TODO: finish the test
  end

  def test_destroy
    # TODO: finish the test
  end
end
