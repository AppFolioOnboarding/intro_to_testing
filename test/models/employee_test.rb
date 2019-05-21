require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def test_employee__valid
    employee = Employee.new(name: 'God', age: 10)

    assert_predicate employee, :valid?
  end

  def test_name__invalid_if_name_is_blank
    employee = Employee.new(name: '', age: 10)

    refute_predicate employee, :valid?
    assert_equal "can't be blank", employee.errors.messages[:name].first
  end

  def test_name__invalid_if_name_does_not_start_with_uppercase
    # TODO: finish the test
  end

  def test_age__invalid_if_age_is_not_a_number
    # TODO: finish the test
  end
end
