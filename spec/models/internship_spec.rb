require 'rails_helper'

RSpec.describe Internship, :type => :model do
  let(:internship) { build :internship  }

  context 'given a valid Internship' do
    it 'can be saved with all required attributes present' do
      expect(internship.save).to be_truthy
    end
  end

  context 'given an invalid Internship' do
    it 'rejects empty semester_ids' do
      internship.semester_id = nil
      expect(internship.save).to be_falsy
    end

    it 'rejects empty student_ids' do
      internship.student_id = nil
      expect(internship.save).to be_falsy
    end
  end

  describe "#rating" do
    it 'returns the correct rating' do
      expect(internship.rating).to eq(3)
    end
  end

  describe "#editable?" do
    it 'should return true' do
      expect(internship.editable?).to eq(true)
    end

    it 'should return false' do
      internship.completed = true
      expect(internship.editable?).to eq(false)
    end
  end

  describe "#enrolment_number" do
    it 'should return the correct enrolment_number' do
      expect(internship.enrolment_number).to eq("enrollment number")
    end
  end

  describe "trigger InternshipObserver#after_update" do
    it 'should trigger after_upate in the observer' do
      internship = create :internship
      report_state = create :report_state

      internship.report_state = report_state
      expect(internship.save).to be_truthy
    end
  end
end
