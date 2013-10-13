require 'spec_helper'

describe Vote do
  let(:user) { FactoryGirl.create(:user) }
  let(:lunch) { FactoryGirl.create(:lunch, user_id: user.id) }
  let(:restaurant) { FactoryGirl.create(:restaurant, lunch_id: lunch.id, 
  					name: "Chickfila", website: "www.chickfila.com", user_id: user.id)}
  before do
  	@vote = Vote.new(restaurant_id: restaurant.id, user_id: user.id)
  end

  subject { @vote }

  it { should respond_to(:restaurant_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:up_vote) }
end
