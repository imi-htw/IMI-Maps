require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, :type => :helper do
  describe "#flash_class" do
    it 'should return the correct css classes' do
      expect(helper.flash_class(:notice)).to eq "alert alert-info"
      expect(helper.flash_class(:success)).to eq "alert alert-success"
      expect(helper.flash_class(:error)).to eq "alert alert-error"
      expect(helper.flash_class(:alert)).to eq "alert alert-info"
    end
  end

  describe "#get_notifications" do
    it 'should return the correct notifications' do
      expect(helper.get_notifications).to eq []
    end
  end
end
