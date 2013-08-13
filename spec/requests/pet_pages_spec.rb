require 'spec_helper'

describe "PetPages" do
  subject { page }

  describe "pet profile page" do
    let(:pet) { FactoryGirl.create(:pet) }
    before { visit pet_path(pet) }

    it { should have_selector('h1', text: pet.name) }
    it { should have_selector('title', text: pet.name) }
    it { should have_selector('h2', text: pet.birth_date.to_s) }
    it { should have_selector('img', url: pet.profile_picture.thumb.url) }
  end
  
  describe "pet registration page" do
    before { visit new_pet_path }

    it { should have_selector('h1', text: "Register") }
    it { should have_selector('title', text: "Register Pet") }
  end
end
