require 'spec_helper'

describe "PetPages" do
  before do
    SiteSettings.title = "Breeder CMS"
    SiteSettings.species = "dog"
    SiteSettings.baby_species = "pet"
    SiteSettings.breed = "pet"
    SiteSettings.short_breed = "pet"
  end

  subject { page }

  describe "pet profile page" do
    let(:pet) { FactoryGirl.create(:pet) }
    let!(:p1) { FactoryGirl.create(:photo, pet: pet) }
    let!(:p2) { FactoryGirl.create(:photo, pet: pet) }
                
    before { visit pet_path(pet) }

    it { should have_selector('h1', text: pet.name) }
    it { should have_selector('title', text: pet.name) }
    it { should have_selector('h2', text: pet.birth_date.to_s) }
    it { should have_selector('img', url: pet.profile_picture.thumb.url) }

    it { should have_selector('dd', text: (pet.gender == "M" ? "Male" : "Female")) }
    it { should have_selector('dd', text: pet.color) }
    it { should have_selector('dd', text: pet.eye_color) }
    it { should have_selector('dd', text: pet.breed) }
    it { should have_selector('dd', text: pet.height.to_s) }
    it { should have_selector('dd', text: pet.weight.to_s) }
    it { should have_selector('dd', text: pet.age) }
    it { should have_content(pet.description) }

    describe "photos" do
      it { should have_selector('img', url: p1.image.thumb.url) }

      it { should have_content(p1.caption) }

      it { should have_selector('img', url: p2.image.thumb.url) }
      it { should have_content(p2.caption) }
    end

    describe "when color is not specified" do
      let(:pet) { FactoryGirl.create(:pet, color: nil) }

      it { should_not have_selector('dt', text: /^Color$/) }
    end

    describe "when eye color is not specified" do
      let(:pet) { FactoryGirl.create(:pet, eye_color: nil) }

      it { should_not have_selector('dt', text: "Eye Color") }
    end

    describe "when breed is not specified" do
      let(:pet) { FactoryGirl.create(:pet, breed: nil) }

      it { should_not have_selector('dt', text: "Breed") }
    end

    describe "when height is not specified" do
      let(:pet) { FactoryGirl.create(:pet, height: nil) }

      it { should_not have_selector('dt', text: "Height") }
    end

    describe "when weight is not specified" do
      let(:pet) { FactoryGirl.create(:pet, weight: nil) }

      it { should_not have_selector('dt', text: "Weight") }
    end
  end
  
  describe "pet registration page" do
    before { visit new_pet_path }

    it { should have_selector('h1', text: "Register") }
    it { should have_selector('title', text: "Register Pet") }
  end

  describe "pet listing page" do
    before do
      5.times { FactoryGirl.create(:pet) }
      visit pets_path 
    end

    it { should have_selector('h1', text: "Our Pets") }
    it { should have_selector('title', text: "Our Pets") }

    it "should display each pets name" do
      Pet.all.each do |p|
        page.should have_content(p.name)
      end
    end

    it "should display each pets profile picture" do
      Pet.all.each do |p|
        page.should have_selector('img', url: p.profile_picture.thumb.url) 
      end
    end
  end
end
