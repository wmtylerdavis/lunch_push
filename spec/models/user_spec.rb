require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User")
	end

	subject { @user }

  it { should respond_to(:name) }
  it { should be_valid }

  it { should respond_to(:remember_token) }

  describe "when name is not present" do
  		before { @user.name = " " }
  		it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end