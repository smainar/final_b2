class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def sort_by_grade(direction = :desc, limit = nil)
    self.student_courses.order(grade: direction).limit(limit)
  end
end
