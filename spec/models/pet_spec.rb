# == Schema Information
#
# Table name: pets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Pet do
  before { @pet = Pet.new(name: "Rover", birth_date: "2001-01-01") }

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
end
