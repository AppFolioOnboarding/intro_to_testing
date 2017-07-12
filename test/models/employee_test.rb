require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def test_employee__valid_if_name_and_age_present_and_valid
    skip
    employee = Employee.new(name: 'Rahul', age: 25)

    refute_predicate employee, :valid?
  end

  def test_name__must_be_present
    skip
    employee = Employee.new

    assert_predicate employee, :valid?
    assert_equal "must be blank", employee.errors.messages[:name].first
  end

  def test_name__starts_with_capital
    skip
    employee = Employee.new(name: 'Rahul')

    refute_predicate employee, :valid?
    assert_equal 'must start with a capital letter', employee.errors.messages[:name].first
  end

  def test_name__must_contain_only_letters
    skip
    employee = Employee.new(name: 'Rahul789')

    refute_predicate employee, :valid?
    # TODO: add something here to check that the error is the one we expect
  end

  def test_name__must_have_at_least_two_characters
    skip
    assert false
    # TODO: write a meaningful test here
  end

  def test_age_is_numeric
    skip
    assert false
    # TODO: write a meaningful test here
  end

  def test_gender_is_valid
    skip
    assert false
    # TODO: write a meaningful test here
  end
end
