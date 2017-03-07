require 'rails_helper'

RSpec.describe Answer, :type => :model do
  before :each do
    @answer = build :answer
  end

  context 'given a valid Answer' do
    it 'can be saved with all required attributes present' do
      expect(@answer.save).to be_truthy
    end
  end

  context 'given an invalid Answer' do
    it 'rejects an empty body' do
      @answer.body = nil
      expect(@answer.save).to be_falsy
    end

    it 'rejects an empty internship_id' do
      @answer.internship_id = nil
      expect(@answer.save).to be_falsy
    end

    it 'rejects an empty user_comment_id' do
      @answer.user_comment_id = nil
      expect(@answer.save).to be_falsy
    end
  end
end
