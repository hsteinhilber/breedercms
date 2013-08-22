require 'spec_helper'

describe Photo do
  let(:pet) { FactoryGirl.create(:pet) }

  before do 
    @photo = pet.photos.build(image: "./spec/support/Tapanga.jpg", 
                              caption: "Tapanga mug shot")
  end
  subject { @photo }
  
  it { should be_valid }

  it { should respond_to(:image) }

  it { should respond_to(:caption) }

  it { should respond_to(:pet_id) }

  describe "when pet id is not present" do
    before { @photo.pet_id = nil }
    it { should_not be_valid }
  end

  it { should respond_to(:pet) }

  its(:pet) { should == pet }

  describe "accessible attributes" do
    it "should not allow access to pet_id" do
      expect do
        Photo.new(pet_id: pet.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end
