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
  before { @pet = Pet.new(name: "Rover", birth_date: "2001-01-01", profile_picture: File.open("spec/support/tapanga.jpg")) }

  subject { @pet }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @pet.name = "" }
    it { should_not be_valid }
  end

  describe "whne name is too long" do
    before { @pet.name = "a" * 51 }
    it { should_not be_valid }
  end

  it { should respond_to(:birth_date) }

  describe "when birth_date is not present" do
    before { @pet.birth_date = nil }
    it { should_not be_valid }
  end
  
  it { should respond_to(:profile_picture) }
   
  describe "when profile_picture is not present" do
    before { @pet.profile_picture.remove! }
    it { should_not be_valid }
  end

  it { should respond_to(:profile_picture_url) }
end
