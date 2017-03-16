require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { build :user }

  context 'given a valid user' do
    it 'can be saved with all required attributes present' do
      expect(user.save).to be_truthy
    end
  end

  context 'given an invalid user' do
    it 'rejects empty emails' do
      user.email = nil
      expect(user.save).to be_falsy
    end

    it 'rejects empty passwords' do
      user.password = nil
      expect(user.save).to be_falsy
    end

    it 'rejects passwords shorter than 5 characters' do
      user.password = "asdf"
      expect(user.save).to be_falsy

    end

    it 'rejects empty student relations' do
      user.student = nil
      expect(user.save).to be_falsy
    end
  end

  describe "#name" do
    it 'should return the correct name' do
      expect(user.name).to eq "#{user.student.first_name} #{user.student.last_name}"
    end
  end

  describe "#enrolment_number" do
    it 'should return nil if no student is present' do
      user.student = nil
      expect(user.enrolment_number).to eq nil
    end

    it 'should return the correct enrolment_number' do
      expect(user.enrolment_number).to eq user.student.enrolment_number
    end
  end

  describe "#send_password_reset" do
    it 'should return true' do
      expect(user.send_password_reset).to be_truthy
    end
  end

  describe "UserObserver" do
    it 'should trigger the observer method' do
      user.student.internships << build(:internship, student: user.student, completed: false)
      user.student.internships << build(:internship, student: user.student, completed: false)
      expect(user.save).to be_truthy
    end
  end
end
