require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "#forgot_pws" do

    before :each do
      @user = create :user
      @user.password_reset_token = "foo"
      @mail = UserMailer.forgot_pwd(@user)
    end

    it 'renders the subject' do
      expect(@mail.subject).to eq("(IMI-Map)Password Reset")
    end

    it 'renders the recipient email' do
      expect(@mail.to).to eq([@user.email])
    end

    it 'assigns @user' do
      expect(@mail.body.encoded).to match(@user.password_reset_token)
    end
  end
end
