require 'spec_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before(:all) {
    @pet = FactoryGirl.create(:pet)
    @uploader = ImageUploader.new(@pet, :profile_picture) 
    @uploader.store!(File.open('spec/support/tapanga.jpg'))
  }

  after(:all) { @uploader.remove! }

  subject { @uploader }

  it { should respond_to(:store_dir) }
  its(:store_dir) { should match("uploads/pet/profile_picture/#{@pet.id}") }
  
  it { should respond_to(:thumb) }
  its(:thumb) { should be_no_larger_than(256, 256) }

end
