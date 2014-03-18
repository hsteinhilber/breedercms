# == Schema Information
#
# Table name: pets
#
#  profile_pic     :text
#  id              :integer          primary key
#  name            :string(255)
#  birth_date      :date
#  created_at      :datetime
#  updated_at      :datetime
#  profile_picture :string(255)
#

require 'spec_helper'

describe Pet do
  before { @pet = Pet.new(name: "Rover", birth_date: "2001-01-01", 
                          profile_picture: File.open("spec/support/tapanga.jpg"),
                          gender: 'M') }

  subject { @pet }

  it { should respond_to(:name) }
  it { should respond_to(:name=) }

  it { should be_valid }

  describe "when name is not present" do
    before { @pet.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @pet.name = "a" * 51 }
    it { should_not be_valid }
  end

  it { should respond_to(:birth_date) }
  it { should respond_to(:birth_date=) }

  describe "when birth_date is not present" do
    before { @pet.birth_date = nil }
    it { should_not be_valid }
  end
  
  it { should respond_to(:profile_picture) }
  it { should respond_to(:profile_picture=) }
   
  describe "when profile_picture is not present" do
    before { @pet.profile_picture.remove! }
    it { should_not be_valid }
  end

  it { should respond_to(:profile_picture_url) }

  it { should respond_to(:gender) }
  it { should respond_to(:gender=) }

  describe "when gender is not present" do
    before { @pet.gender = nil }
    it { should_not be_valid }
  end

  describe "when gender is not 'M' or 'F'" do
    before { @pet.gender = 'B' }
    it { should_not be_valid }
  end

  describe "when gender is 'M'" do
    before { @pet.gender = 'M' }
    it { should be_valid }
  end

  describe "when gender is 'F'" do
    before { @pet.gender = 'F' }
    it { should be_valid }
  end

  it { should respond_to(:color) }
  it { should respond_to(:color=) }

  it { should respond_to(:eye_color) }
  it { should respond_to(:eye_color=) }

  it { should respond_to(:breed) }
  it { should respond_to(:breed=) }

  it { should respond_to(:height) }
  it { should respond_to(:height=) }

  it { should respond_to(:weight) }
  it { should respond_to(:weight=) }

  it { should respond_to(:age) }

  describe "when birthday has not yet passed" do
    before do
      Date.stub(:today).and_return("2013-8-1".to_date)
      @pet.birth_date = "2001-12-1"
    end

    its(:age) { should == "11 years" }
  end

  describe "when birthday has already passed" do
    before do
      Date.stub(:today).and_return("2013-8-1".to_date) 
      @pet.birth_date = "2001-5-1"
    end

    its(:age) { should == "12 years" }
  end

  describe "when age is less than 2 years, give age in months" do
    before do
      Date.stub(:today).and_return("2013-8-1".to_date)
      @pet.birth_date = "2011-9-1"
    end

    its(:age) { should == "23 months" }
  end

  it { should respond_to(:description) }
  it { should respond_to(:description=) }

  it { should respond_to(:photos) }

  describe "photos association" do
    before do
      @pet.save
      3.times { FactoryGirl.create(:photo, pet: @pet) }
    end

    its(:photos) { should_not be_empty }
    
    it "should destroy associated photos" do
      photos = @pet.photos.dup
      @pet.destroy
      photos.should_not be_empty
      photos.each do |photo|
        Photo.find_by_id(photo.id).should be_nil
      end
    end
  end

  it { should respond_to(:litters) }

  describe "when destroying" do
    before { @pet.save }

    it "should remove the profile picture" do
      filename = @pet.profile_picture.file.path
      File.exist?(filename).should be_true
      @pet.destroy
      File.exist?(filename).should be_false
    end
  end
end
