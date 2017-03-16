require "rails_helper"

RSpec.describe Internship, :type => :mailer do
  before :each do
    @user = create :user
    @internship = create :internship
    @mail = InternshipMailer.internship_ready(@internship, @user)
  end
  describe "#internship_ready" do
    it 'renders the subject' do
      expect(@mail.subject).to eq("IMI-Map: Please tell us about your internship")
    end

    it 'renders the recipient email' do
      expect(@mail.to).to eq([@user.email])
    end

    it 'assigns @internship' do
      expect(@mail.body.encoded).to match(@internship.id.to_s)
    end
  end
end
