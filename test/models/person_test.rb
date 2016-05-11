require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def test_name__valid
    person = Person.new(name: 'Rahul')

    assert person.valid?
  end

  def test_name__must_be_present
    person = Person.new

    refute person.valid?
    assert_equal "can't be blank", person.errors.messages[:name].first
  end

  def test_name__starts_with_capital
    person = Person.new(name: 'rahul')

    refute person.valid?
    assert_equal 'must start with a capital letter', person.errors.messages[:name].first
  end

  def test_name__must_contain_only_letters
    person = Person.new(name: 'Rahul789')

    refute person.valid?
    assert_equal 'must be made of letters only and be at least 2 characters long', person.errors.messages[:name].first
  end

  def test_name__must_have_at_least_two_characters
    person = Person.new(name: 'R')

    refute person.valid?
    assert_equal 'must be made of letters only and be at least 2 characters long', person.errors.messages[:name].first
  end

  def test_age_is_numeric
    person = Person.new(age: 'fifty')

    refute person.valid?
    assert_equal 'is not a number', person.errors.messages[:age].first
  end

  def test_gender_is_valid
    person = Person.new(gender: 'male')

    refute person.valid?
    assert_equal "must be 'F' or 'M'", person.errors.messages[:gender].first
  end
end
