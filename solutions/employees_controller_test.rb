require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = Employee.create!(name: 'Alice', age: 25, gender: 'F')
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select('h1', 'Listing Employees')
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { age: @employee.age, gender: @employee.gender, name: @employee.name }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should fail to create with invalid data" do
    assert_difference('Employee.count', 0) do
      post :create, employee: { age: 'fifty', gender: @employee.gender, name: @employee.name }
    end

    assert_response :success
    assert_select('#error_explanation ul li', "Age is not a number")
    assert_select 'ul' do
      assert_select 'li', 1
    end
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { age: @employee.age, gender: @employee.gender, name: @employee.name }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
