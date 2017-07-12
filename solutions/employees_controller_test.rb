require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25, gender: 'F')
  end

  test 'should get index' do
    get employees_path
    assert_response :ok
    assert_select '#header', 'Listing Employees'
  end

  test 'should get new' do
    get new_employee_path
    assert_response :ok
    assert_select '#header', 'New Employee'
  end

  test 'should create employee' do
    assert_difference('Employee.count', 1) do
      post employees_path, employee: { age: @employee.age, gender: @employee.gender, name: @employee.name }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test 'should fail to create with invalid data' do
    assert_no_difference('Employee.count') do
      post employees_path, employee: { age: 'fifty', gender: @employee.gender, name: @employee.name }
    end

    assert_response :ok
    assert_select('#error_explanation ul li', "Age is not a number")
    assert_select 'ul' do
      assert_select 'li', 1
    end
  end

  test 'should show employee' do
    get employee_path(@employee)
    assert_response :ok
    assert_select '#name', text: @employee.name
    assert_select '#gender', text: @employee.gender
    assert_select '#age', text: @employee.age.to_s
  end

  test 'should get edit' do
    get edit_employee_path(@employee)
    assert_response :ok
    assert_select '#header', 'Editing Employee'
  end

  test 'should update employee' do
    patch employee_path(@employee), employee: { age: @employee.age + 1, gender: @employee.gender, name: @employee.name }
    assert_redirected_to employee_path(@employee)
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete employee_path(@employee)
    end

    assert_redirected_to employees_path
  end
end
