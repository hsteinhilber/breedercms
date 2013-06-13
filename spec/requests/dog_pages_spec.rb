require 'spec_helper'

describe "DogPages" do
  subject { page }

  describe "dog profile page" do
    let(:dog) { FactoryGirl.create(:dog) }
    before { visit dog_path(dog) }

    it { should have_selector('h1', text: dog.name) }
    it { should have_selector('title', text: dog.name) }
    it { should have_selector('h2', text: dog.birth_date.to_s) }
  end
  
  describe "dog registration page" do
    before { visit new_dog_path }

    it { should have_selector('h1', text: "Register") }
    it { should have_selector('title', text: "Register Pet") }
  end
end
