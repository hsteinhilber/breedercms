require 'spec_helper'

describe Photo do
  let(:pet) { FactoryGirl.create(:pet) }

  before do 
    @photo = pet.photos.build(image: File.open("./spec/support/Tapanga.jpg"), 
                              caption: "Tapanga mug shot")
  end
  subject { @photo }
  
  it { should be_valid }

  it { should respond_to(:image) }
  it { should respond_to(:image=) }

  describe "when image is not present" do
    before { @photo.image.remove! }
    it { should_not be_valid }
  end

  it { should respond_to(:image_url) }

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

  describe "when destroying photo" do
    before { @photo.save }
    it "should remove the image file" do
      filename = @photo.image.file.path
      File.exist?(filename).should be_true
      @photo.destroy
      File.exist?(filename).should be_false
    end
  end

end
