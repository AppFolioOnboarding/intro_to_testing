class Employee < ActiveRecord::Base
  validates :name, presence: true
  validate :name_is_valid
  validates :age, numericality: true
  validate :gender_is_valid

  private

  def name_is_valid
    return unless name.present?

    name_starts_with_uppercase
    name_only_contains_letters_and_is_long_enough
  end

  def name_starts_with_uppercase
    errors.add(:name, 'must start with a capital letter') unless name.capitalize == name
  end

  NAME_ERROR_MESSAGE = 'must be made of letters only and be at least 2 characters long'.freeze

  def name_only_contains_letters_and_is_long_enough
    errors.add(:name, NAME_ERROR_MESSAGE) unless name =~ /^[a-zA-Z]{2,}$/
  end

  def gender_is_valid
    errors.add(:gender, "must be 'F' or 'M'") unless gender.nil? || %w(F M).include?(gender)
  end
end
