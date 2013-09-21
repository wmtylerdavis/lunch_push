require 'spec_helper'

describe Restaurant do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:lunch) { FactoryGirl.create(:lunch, user_id: user.id) }
  before do
  	@restaurant = Restaurant.new(lunch_id: lunch.id, name: "Chickfila", 
  								website: "www.chickfila.com")
  end

  subject { @restaurant }

  it { should respond_to(:name) }
  it { should respond_to(:website) }
  it { should respond_to(:vote_count) }
  it { should respond_to(:no_vote) }
  it { should respond_to(:lunch_id) }
end