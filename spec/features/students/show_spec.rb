require "rails_helper"

RSpec.describe "Student Show Page", type: :feature do
  describe "As a user" do
    before(:each) do
      @student_1 = Student.create!(name: "Elmo")
      @student_2 = Student.create!(name: "Bird Bird")
      @student_3 = Student.create!(name: "Cookie Monster")

      @course_1 = Course.create!(name: "Classics")
      @course_2 = Course.create!(name: "History")
      @course_3 = Course.create!(name: "Math")
      @course_4 = Course.create!(name: "Science")

      @student_course_1 = StudentCourse.create!(grade: 3.25, course: @course_1, student: @student_1)
      @student_course_2 = StudentCourse.create!(grade: 3.50, course: @course_2, student: @student_1)
      @student_course_3 = StudentCourse.create!(grade: 2.75, course: @course_2, student: @student_2)
      @student_course_4 = StudentCourse.create!(grade: 3.00, course: @course_3, student: @student_2)
      @student_course_5 = StudentCourse.create!(grade: 4.00, course: @course_4, student: @student_3)
      @student_course_6 = StudentCourse.create!(grade: 3.20, course: @course_1, student: @student_3)
    end

    it "When I visit a student show page, I see the student's info - name, courses, and grades" do
      visit student_path(@student_1)
      
      within "#student-#{@student_1.id}" do
        expect(page).to have_content("Name: #{@student_1.name}")
        expect(page).to have_content("Course: #{@student_course_1.course.name}, Grade: #{@student_course_1.grade}")
        expect(page).to have_content("Course: #{@student_course_2.course.name}, Grade: #{@student_course_2.grade}")
      end

      visit student_path(@student_2)

      within "#student-#{@student_2.id}" do
        expect(page).to have_content("Name: #{@student_2.name}")
        expect(page).to have_content("Course: #{@student_course_3.course.name}, Grade: #{@student_course_3.grade}")
        expect(page).to have_content("Course: #{@student_course_4.course.name}, Grade: #{@student_course_4.grade}")
      end

      visit student_path(@student_3)

      within "#student-#{@student_3.id}" do
        expect(page).to have_content("Name: #{@student_3.name}")
        expect(page).to have_content("Course: #{@student_course_5.course.name}, Grade: #{@student_course_5.grade}")
        expect(page).to have_content("Course: #{@student_course_6.course.name}, Grade: #{@student_course_6.grade}")
      end
    end
  end
end
