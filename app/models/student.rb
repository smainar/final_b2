class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :courses, through: :student_courses
end
