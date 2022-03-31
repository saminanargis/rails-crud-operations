class Employee < ApplicationRecord
  validates :name, length: { minimum: 10 }
  validates :job, length: { minimum: 15 }
  validates :department, length: { in: 15..50 }
  validates :salary, numericality: {greater_than_or_equal_to: 0}
  validates :hire_date, presence: true
end
