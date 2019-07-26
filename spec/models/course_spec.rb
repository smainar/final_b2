require "rails_helper"

RSpec.describe Student, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :student_courses }
    it { should have_many(:courses).through(:student_courses) }
  end

  describe "instance methods" do
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

    describe "#sort_by_grade" do
      it "returns an array, grouped by course, and listed in order from highest grade to lowest grade" do
        expect(@course_1.sort_by_grade).to eq([@student_course_1, @student_course_6, @student_course_7])
        expect(@course_2.sort_by_grade).to eq([@student_course_2, @student_course_8, @student_course_3])
        expect(@course_3.sort_by_grade).to eq([@student_course_9, @student_course_4])
        expect(@course_4.sort_by_grade).to eq([@student_course_5, @student_course_10])
      end
    end
  end
end
