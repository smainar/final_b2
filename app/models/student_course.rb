class StudentCourse < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :grade, presence: true, numericality: { less_than_or_equal_to: 4.00 }
end
