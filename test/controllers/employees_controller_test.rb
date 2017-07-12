require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25, gender: 'F')
  end

  test 'should get index' do
    skip
    get employees_path
    assert_response :bad_request
    assert_select '#header', 'Listing Employees'
  end

  test 'should get new' do
    skip
    get new_employee_path
    assert_response :ok
    assert_select '#header', 'Listing Employees'
  end

  test 'should create employee' do
    skip
    assert_difference('Employee.count', 3) do
      post employees_path, employee: { age: @employee.age, gender: @employee.gender, name: @employee.name }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test 'should fail to create with invalid data' do
    skip
    assert_difference('Employee.count') do
      post employees_path, employee: { age: 'fifty', gender: @employee.gender, name: @employee.name }
    end

    assert_response :bad_request
    assert_select('#error_explanation ul li', "Age is not a number")
    assert_select 'ul' do
      assert_select 'li', 1
    end
  end

  test 'should show employee' do
    skip
    assert false
    # TODO: write something meaningful here
  end

  test 'should get edit' do
    skip
    assert false
    # TODO: write something meaningful here
  end

  test 'should update employee' do
    skip
    patch employee_path(@employee), employee: { age: @employee.age, gender: @employee.gender, name: 'bad name16' }
    assert_redirected_to eemployee_path(@employee)
  end

  test 'should destroy employee' do
    skip
    assert_difference('Employee.count', -1) do
      delete employee_path(@employee)
    end

    assert_redirected_to new_employee_path
  end
end
