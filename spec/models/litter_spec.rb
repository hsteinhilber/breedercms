require 'spec_helper'

describe Litter do
  let(:father) { FactoryGirl.create(:pet) }
  let(:mother) { FactoryGirl.create(:pet) }
  
  before do
    @litter = Litter.new(birth_date: '2014-01-01', father_id: father.id, mother_id: mother.id) 
  end

  subject { @litter }

  it { should respond_to(:birth_date) }

  it { should respond_to(:father_id) }
  it { should respond_to(:father) }
  its(:father) { should eq father }

  it { should respond_to(:mother_id) }
  it { should respond_to(:mother) }
  its(:mother) { should eq mother }

  it { should be_valid }

  describe "when mother_id is not present" do
    before { @litter.mother_id = nil }
    it { should_not be_valid }
  end

  describe "when father_id is not present" do
    before { @litter.father_id = nil }
    it { should_not be_valid }
  end
end
