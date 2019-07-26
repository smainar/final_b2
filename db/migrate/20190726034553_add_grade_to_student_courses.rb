class AddGradeToStudentCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :student_courses, :grade, :decimal
  end
end
