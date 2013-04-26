require 'spec_helper'

describe Internship do
  describe "validations" do 
    it { should validate_presence_of(:orientation) }
    it { should validate_presence_of(:programming_language_ids) }
    it { should validate_presence_of(:living_costs) }
    it { should validate_presence_of(:salary_id) }
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating) }
    it { should validate_numericality_of(:salary_id) }
    xit { should validate_numericality_of(:living_costs) }
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
