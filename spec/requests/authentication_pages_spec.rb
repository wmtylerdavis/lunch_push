require 'spec_helper'

describe "Authentication" do

	subject { page }

	let(:submit) { "Sign in" }

	describe "signin" do
		before { visit signin_path }

		describe "with invalid information" do
			before { click_button submit }

			it { should have_content('Sign in') }
			it { should have_title('Sign in') }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "Home" }
				it { should_not have_selector('div.alert.alert-error') }
			end
		end

		 describe "with valid information" do
      		let(:user) { FactoryGirl.create(:user) }
      		before do
        		fill_in "Name",    with: user.name
      		end

      		it "should create a user" do
      			expect { click_button submit }.to change(User, :count).by(1)
      		end
    	end

    	describe "it changes links" do
    		let(:user) { FactoryGirl.create(:user) }
    		before do
    			fill_in "Name", with: user.name
    			click_button submit
    		end

    		it { should have_link('Sign out',    href: signout_path) }
      		it { should_not have_link('Sign in', href: signin_path) }
      	end
	end
end
