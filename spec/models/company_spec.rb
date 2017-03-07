require 'rails_helper'

RSpec.describe Company, :type => :model do
  before :each do
    @company = build :company
  end

  context 'given a valid Company' do
    it 'can be saved with all required attributes present' do
      expect(@company.save).to be_truthy
    end
  end

  context 'given an invalid Company' do
    it 'rejects an empty name' do
      @company.name = nil
      expect(@company.save).to be_falsy
    end
  end

  describe "#address" do
    it 'builds the expected address string' do
      expect(@company.address).to eq [@company.street, @company.zip, @company.city, @company.country].join(', ')
    end
  end

  describe "#enrolment_number" do
    it 'builds the expected enrolment_number result' do
      @company.internships << create(:internship)
      @company.internships << create(:internship)
      @company.internships << create(:internship)
      @student = build :student

      expect(@company.internships.size).to eq(3)
      expect(@company.enrolment_number).to eq(Array.new(3, @student.enrolment_number).join(', '))
    end
  end

  describe "#average_rating" do
    context 'with only completed internships' do
      it 'calculates the correct average rating' do
        @company.internships << create(:internship, completed: true)
        @company.internships << create(:internship, completed: true)
        @company.internships << create(:internship, completed: true)
        expect(@company.average_rating).to eq(3)
      end
    end

    context 'with internships having mixed completion states' do
      it 'calculates the correct average rating' do
        @company.internships << create(:internship, completed: true)
        @company.internships << create(:internship)
        expect(@company.average_rating).to eq(3)
      end
    end
  end
end
