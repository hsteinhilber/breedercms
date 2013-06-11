# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Dog do
  before { @dog = Dog.new(name: "Rover", birth_date: "2001-01-01") }

  subject { @dog }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @dog.name = "" }
    it { should_not be_valid }
  end

  describe "whne name is too long" do
    before { @dog.name = "a" * 51 }
    it { should_not be_valid }
  end

  it { should respond_to(:birth_date) }

  describe "when birth_date is not present" do
    before { @dog.birth_date = nil }
    it { should_not be_valid }
  end
end
