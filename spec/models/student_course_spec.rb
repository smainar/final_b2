require "rails_helper"

RSpec.describe StudentCourse, type: :model do
  describe "relationships" do
    it { should belong_to :student }
    it { should belong_to :course }
  end

  describe "validations" do
    it { should validate_presence_of :grade }
    it { should validate_numericality_of(:grade).is_less_than_or_equal_to(4.00) }
  end
end
