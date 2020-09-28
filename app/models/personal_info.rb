class PersonalInfo < ApplicationRecord
  validates :full_name, :age, :sex, :nationality, :civil_status, presence: true
  validates :full_name, :nationality, length: { maximum: 50 }
  validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 14, less_than_or_equal_to: 120}

  validate :valid_civil_status

  private

  def valid_civil_status
    errors.add(:civil_status, :invalid) unless include_valid_civil_status?
  end

  def include_valid_civil_status?
    options_to_civil_status.each { | option| return civil_status.include?(option) }
  end

  def options_to_civil_status
    %w[casado(a) viuvo(a) separado(a) divorciado(a) solteiro(a)]
  end
end
