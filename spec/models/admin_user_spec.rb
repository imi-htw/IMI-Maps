require 'rails_helper'

RSpec.describe AdminUser, :type => :model do
  before :each do
    @admin_user = build :admin_user
  end

  context 'given an valid AdminUser' do
    it 'can be saved with all required attributes' do
      expect(@admin_user.save).to be_truthy
    end
  end

  context 'given an invalid AdminUser' do
    it 'rejects an empty email' do
      @admin_user.email = nil
      expect(@admin_user.save).to be_falsy
    end

    it 'rejects an empty password' do
      @admin_user.password = nil
      expect(@admin_user.save).to be_falsy
    end

    it 'rejects an empty password_confirmation' do
      @admin_user.password_confirmation = nil
      expect(@admin_user.save).to be_falsy
    end
  end

end
