require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Team Lunch" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Team Lunch') }
    it { should have_title("#{base_title}") }
    it { should_not have_title('| Home') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title("#{base_title} | About") }
  end
end