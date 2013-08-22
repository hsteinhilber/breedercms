require 'spec_helper'

describe Photo do
  let(:pet) { FactoryGirl.create(:pet) }

  before do 
    @photo = Photo.new(image: "./spec/support/Tapanga running.jpg",
                       caption: "Tapanga running around", pet_id: pet.id) 
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
end
