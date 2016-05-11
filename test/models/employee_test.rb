require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def test_name__valid
    employee = Employee.new(name: 'Rahul', age: 25)

    refute employee.valid?
  end

  def test_name__must_be_present
    employee = Employee.new

    assert employee.valid?
    assert_equal "must be blank", employee.errors.messages[:name].first
  end

  def test_name__starts_with_capital
    employee = Employee.new(name: 'Rahul')

    refute employee.valid?
    assert_equal 'must start with a capital letter', employee.errors.messages[:name].first
  end

  def test_name__must_contain_only_letters
    employee = Employee.new(name: 'Rahul789')

    refute employee.valid?
    # TODO: add something here to check that the error is the one we expect
  end

  def test_name__must_have_at_least_two_characters
    assert false
    # TODO: write a meaningful test here
  end

  def test_age_is_numeric
    assert false
    # TODO: write a meaningful test here
  end

  def test_gender_is_valid
    assert false
    # TODO: write a meaningful test here
  end
end
