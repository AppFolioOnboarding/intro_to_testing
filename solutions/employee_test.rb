require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def test_name__valid
    employee = Employee.new(name: 'Rahul', age: 25)

    assert employee.valid?
  end

  def test_name__must_be_present
    employee = Employee.new

    refute employee.valid?
    assert_equal "can't be blank", employee.errors.messages[:name].first
  end

  def test_name__starts_with_capital
    employee = Employee.new(name: 'rahul')

    refute employee.valid?
    assert_equal 'must start with a capital letter', employee.errors.messages[:name].first
  end

  def test_name__must_contain_only_letters
    employee = Employee.new(name: 'Rahul789')

    refute employee.valid?
    assert_equal 'must be made of letters only and be at least 2 characters long', employee.errors.messages[:name].first
  end

  def test_name__must_have_at_least_two_characters
    employee = Employee.new(name: 'R')

    refute employee.valid?
    assert_equal 'must be made of letters only and be at least 2 characters long', employee.errors.messages[:name].first
  end

  def test_age_is_numeric
    employee = Employee.new(age: 'fifty')

    refute employee.valid?
    assert_equal 'is not a number', employee.errors.messages[:age].first
  end

  def test_gender_is_valid
    employee = Employee.new(gender: 'male')

    refute employee.valid?
    assert_equal "must be 'F' or 'M'", employee.errors.messages[:gender].first
  end
end
