# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  subtitle   :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

require 'spec_helper'

describe StaticPage do
  before { @page = StaticPage.new(title: "Example Page", content: "<p>This is some text.</p>") }

  subject { @page }
  
  it { should be_valid }

  it { should respond_to(:title) }
  it { should respond_to(:title=) }
  describe "when title is not present" do
    before { @page.title = " " }
    it { should_not be_valid }
  end

  it { should respond_to(:subtitle) }
  it { should respond_to(:subtitle=) }

  it { should respond_to(:content) }
  it { should respond_to(:content=) }
  describe "when content is not present" do
    before { @page.content = " " }
    it { should_not be_valid }
  end

  it { should respond_to(:slug) }
  it { should respond_to(:slug=) }
  it "should not allow access to slug via mass assignment" do
    expect { subject.update_attributes(slug: "a-new-value") }.to raise_error
  end
  its(:slug) { should eql("example-page") }
  describe "when slug is already taken" do
    before do
      page_with_dup_title = @page.dup
      page_with_dup_title.save
    end
    it { should_not be_valid }
  end
  describe "when changing the title of a page" do
    describe "when the page has already been saved" do
      before do
        @page.save
        @page.title = "Some New Title"
      end
      its(:slug) { should eql("example-page") }
    end
    describe "when the page has not been saved" do
      before { @page.title = "Some New Title" }
      its(:slug) { should eql("some-new-title") }
    end
  end
  describe "when title contains ampersands (&)" do
    before { @page.title = "This Title & That Title" }
    its(:slug) { should eql("this-title-and-that-title") }
  end
  describe "when title contains at (@)" do
    before { @page.title = "A Title @ Home" }
    its(:slug) { should eql("a-title-at-home") }
  end
  describe "when title contains other special characters" do
    before { @page.title = "`A Test's Title - *Special* Characters`" }
    its(:slug) { should eql("a-tests-title-special-characters") }
  end

  it { should respond_to(:to_param) }
  its(:class) { should respond_to(:find_by_param) }
  describe "when searching for a page" do
    before { @page.save }
    it "should find the page using its id" do
      StaticPage.find(@page.id).should eql(@page)
    end
    it "should return nil if page does not exist" do
      StaticPage.find(-99).should be_nil
    end
    it "should find the page using its slug" do
      StaticPage.find(@page.slug).should eql(@page)
    end
  end
  its(:to_param) { should eql(@page.slug) }
end
