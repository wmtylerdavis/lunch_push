require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Lunch Push" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Lunch Push') }
    it { should have_title("#{base_title}") }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        FactoryGirl.create(:lunch, user_id: user.id) 
        sign_in user
        visit root_path
      end
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title("#{base_title} | About") }
  end
end