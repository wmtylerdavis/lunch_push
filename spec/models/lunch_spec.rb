require 'spec_helper'

describe Lunch do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  	# boom
  	@lunch = Lunch.new(user_id: user.id)
  end

  subject { @lunch }

  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @lunch.user_id = nil }
    it { should_not be_valid }
  end
end
