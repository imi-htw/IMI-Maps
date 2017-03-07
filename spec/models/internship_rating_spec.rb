require 'rails_helper'

RSpec.describe InternshipRating, :type => :model do
  let(:internship_rating) { build :internship_rating }
  let(:highest_internship_rating) { build :highest_internship_rating }
  let(:lowest_internship_rating) { build :lowest_internship_rating }

  context 'given a valid InternShipRating' do
    it 'accepts average ratings' do
      expect(internship_rating.save).to be_truthy
    end

    it 'accepts the highest ratings' do
      expect(highest_internship_rating.save).to be_truthy
    end

    it 'accepts the lowest ratings' do
      expect(lowest_internship_rating.save).to be_truthy
    end
  end

  context 'given a valid InternShipRating' do
    it 'does not accept ratings less than 0' do
      expect{
        create :internship_rating, tasks: -1 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, training_success: -1 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, atmosphere: -1 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, supervision: -1 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, appreciation: -1 }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'does not accept ratings greater than 5 ' do
      expect{
        create :internship_rating, tasks: 6 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, training_success: 6 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, atmosphere: 6 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, supervision: 6 }.to raise_error(ActiveRecord::RecordInvalid)
      expect{ create :internship_rating, appreciation: 6 }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "#total_rating" do
    it 'calculated the correct total rating' do
      expect(internship_rating.total_rating).to eq 3
    end
  end
end
