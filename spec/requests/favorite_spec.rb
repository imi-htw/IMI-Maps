require 'spec_helper'

describe Favorite do
   it "takes two parameters and returns a Favorite object" do
     @fav = Favorite.new 1, 1
     @fav.should be_an_instance_of Favorite
   end
end
