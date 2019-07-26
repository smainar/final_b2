require "rails_helper"
# User Story 2, Course Index Page
# As a user,
# When I visit a course index page,
# Then I see each course in the system including:
# - the course's name
# - each student in the course listed in order from highest grade to lowest grade

RSpec.describe "Course Index Page", type: :feature do
  describe "As a user" do
    before(:each) do
      @student_1 = Student.create!(name: "Elmo")
      @student_2 = Student.create!(name: "Bird Bird")
      @student_3 = Student.create!(name: "Cookie Monster")
      @student_4 = Student.create!(name: "Bert")
      @student_5 = Student.create!(name: "Grover")
      @student_6 = Student.create!(name: "Kermit")

      @course_1 = Course.create!(name: "Classics")
      @course_2 = Course.create!(name: "History")
      @course_3 = Course.create!(name: "Math")
      @course_4 = Course.create!(name: "Science")

      # Grouped by course and listed in order from highest grade to lowest grade:

      # Course 1
      @student_course_1 = StudentCourse.create!(grade: 3.25, course: @course_1, student: @student_1)
      @student_course_6 = StudentCourse.create!(grade: 3.20, course: @course_1, student: @student_3)
      @student_course_7 = StudentCourse.create!(grade: 2.75, course: @course_1, student: @student_4)

      # Course 2
      @student_course_2 = StudentCourse.create!(grade: 3.50, course: @course_2, student: @student_1)
      @student_course_8 = StudentCourse.create!(grade: 3.00, course: @course_2, student: @student_5)
      @student_course_3 = StudentCourse.create!(grade: 2.75, course: @course_2, student: @student_2)

      # Course 3
      @student_course_9 = StudentCourse.create!(grade: 3.75, course: @course_3, student: @student_5)
      @student_course_4 = StudentCourse.create!(grade: 3.00, course: @course_3, student: @student_2)

      # Course 4
      @student_course_5 = StudentCourse.create!(grade: 4.00, course: @course_4, student: @student_3)
      @student_course_10 = StudentCourse.create!(grade: 2.90, course: @course_4, student: @student_6)
    end

    it "When I visit a course index page, I see each course in the system including each student in the course listed in order from highest grade to lowest grade" do
      visit courses_path

      within "#course-#{@course_1.id}" do
        expect(page).to have_content(@course_1.name)
        expect(page.all('li')[0]).to have_content("Student: #{@student_1.name}, Grade: #{@student_course_1.grade}")
        expect(page.all('li')[1]).to have_content("Student: #{@student_3.name}, Grade: #{@student_course_6.grade}")
        expect(page.all('li')[2]).to have_content("Student: #{@student_4.name}, Grade: #{@student_course_7.grade}")
      end

      within "#course-#{@course_2.id}" do
        expect(page).to have_content(@course_2.name)
        expect(page.all('li')[0]).to have_content("Student: #{@student_1.name}, Grade: #{@student_course_2.grade}")
        expect(page.all('li')[1]).to have_content("Student: #{@student_5.name}, Grade: #{@student_course_8.grade}")
        expect(page.all('li')[2]).to have_content("Student: #{@student_2.name}, Grade: #{@student_course_3.grade}")
      end

      within "#course-#{@course_3.id}" do
        expect(page).to have_content(@course_3.name)
        expect(page.all('li')[0]).to have_content("Student: #{@student_5.name}, Grade: #{@student_course_9.grade}")
        expect(page.all('li')[1]).to have_content("Student: #{@student_2.name}, Grade: #{@student_course_4.grade}")
      end

      within "#course-#{@course_4.id}" do
        expect(page).to have_content(@course_4.name)
        expect(page.all('li')[0]).to have_content("Student: #{@student_3.name}, Grade: #{@student_course_5.grade}")
        expect(page.all('li')[1]).to have_content("Student: #{@student_6.name}, Grade: #{@student_course_10.grade}")
      end
    end
  end
end
