require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Team Lunch" }

  describe "Home page" do

    it "should have the content 'Team Lunch'" do
      visit '/'
      expect(page).to have_content('Team Lunch')
    end

    it "should have the title 'Home'" do
      visit '/'
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/about'
      expect(page).to have_title("#{base_title} | About")
    end
  end
end