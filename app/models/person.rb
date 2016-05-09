class Person < ActiveRecord::Base
  attr_accessor :name, :age, :gender

  validates :name, presence: true
  validate :name_is_valid


  private

  def name_is_valid
    return unless name.present?

    name_starts_with_uppercase
    name_only_contains_letters_and_is_long_enough
  end

  def name_starts_with_uppercase
    errors.add(:name, 'must start with a capital letter') unless name.capitalize == name
  end

  def name_only_contains_letters_and_is_long_enough
    errors.add(:name, 'must be made of letters only and be at least 2 characters long') unless name.match(/^[a-zA-Z]{2,}$/)
  end
end
