require 'spec_helper'

describe Lunch do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  	# boom
  	@lunch = Lunch.new(user_id: user.id)
  end

  subject { @lunch }

  it { should respond_to(:user_id) }
end
