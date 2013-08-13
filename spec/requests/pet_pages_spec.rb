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

    it { should have_selector('dd', text: pet.gender) }
    it { should have_selector('dd', text: pet.color) }
    it { should have_selector('dd', text: pet.eye_color) }
    it { should have_selector('dd', text: pet.breed) }
    it { should have_selector('dd', text: pet.height.to_s) }
    it { should have_selector('dd', text: pet.weight.to_s) }
    it { should have_selector('dd', text: pet.age) }
    it { should have_content(pet.description) }
  end
  
  describe "pet registration page" do
    before { visit new_pet_path }

    it { should have_selector('h1', text: "Register") }
    it { should have_selector('title', text: "Register Pet") }
  end
end
