require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:student) { build :student }

  describe "#name" do
    it 'returns the correct name' do
      expect(student.name).to eq "#{student.first_name} #{student.last_name}"
    end
  end
end
