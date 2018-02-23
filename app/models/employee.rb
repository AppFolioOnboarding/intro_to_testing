class Employee < ApplicationRecord
  validates :name, presence: true
  validate :name_must_start_with_uppercase
  validates :age, numericality: true

  private

  def name_must_start_with_uppercase
    errors.add(:name, 'must start with a capital letter') unless name.capitalize == name
  end
end
