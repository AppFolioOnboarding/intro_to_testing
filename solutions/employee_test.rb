require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def test_employee__valid__if_name_and_age_present_and_valid
    employee = Employee.new(name: 'Rahul', age: 25)

    assert_predicate employee, :valid?
  end

  def test_name__invalid__if_name_is_blank
    employee = Employee.new

    refute_predicate employee, :valid?
    assert_equal "can't be blank", employee.errors.messages[:name].first
  end

  def test_name__invalid__if_not_starts_with_capital
    employee = Employee.new(name: 'rahul')

    refute_predicate employee, :valid?
    assert_equal 'must start with a capital letter', employee.errors.messages[:name].first
  end

  NAME_ERROR_MESSAGE = 'must be made of letters only and be at least 2 characters long'.freeze

  def test_name__invalid__if_contains_characters_other_than_letters
    employee = Employee.new(name: 'Rahul789')

    refute_predicate employee, :valid?
    assert_equal NAME_ERROR_MESSAGE, employee.errors.messages[:name].first
  end

  def test_name__invalid__if_name_has_less_than_two_characters
    employee = Employee.new(name: 'R')

    refute_predicate employee, :valid?
    assert_equal 'is not a number', employee.errors.messages[:age].first
  end

  def test_age__invalid__if_age_is_not_numeric
    employee = Employee.new(name: 'Rahul', age: 'fifty')

    refute_predicate employee, :valid?
    assert_equal 'is not a number', employee.errors.messages[:age].first
  end

  def test_gender_is_valid
    employee = Employee.new(gender: 'male')

    refute_predicate employee, :valid?
    assert_equal "must be 'F' or 'M'", employee.errors.messages[:gender].first
  end
end
