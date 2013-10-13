require 'spec_helper'

describe Restaurant do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:lunch) { FactoryGirl.create(:lunch, user_id: user.id) }
  before do
  	@restaurant = Restaurant.new(lunch_id: lunch.id, name: "Chickfila", 
  								website: "www.chickfila.com", user_id: user.id)
  end

  subject { @restaurant }

  it { should respond_to(:name) }
  it { should respond_to(:website) }
  it { should respond_to(:vote_count) }
  it { should respond_to(:no_vote) }
  it { should respond_to(:lunch_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when lunch_id is not present" do
    before { @restaurant.lunch_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @restaurant.user = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @restaurant.name = "a" * 31 }
    it { should_not be_valid }
  end
  
end