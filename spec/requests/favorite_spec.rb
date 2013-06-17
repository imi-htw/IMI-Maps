require 'spec_helper'

describe Favorite

 before :each do
    @fav = Favorite.new 1, 1
 end

 describe "#new" do
    it "takes two parameters and returns a Favorite object" do
        @fav.should be_an_instance_of Favorite
  end
 end
end