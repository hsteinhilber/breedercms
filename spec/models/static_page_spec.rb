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
  before { @page = StaticPage.new }

  subject { @page }
  
  it { should be_valid }

  it { should respond_to(:title) }
  it { should respond_to(:title=) }

  it { should respond_to(:subtitle) }
  it { should respond_to(:subtitle=) }

  it { should respond_to(:content) }
  it { should respond_to(:content=) }

  it { should respond_to(:slug) }
  it { should respond_to(:slug=) }
  it "should not allow access to slug via mass assignment" do
    expect { subject.update_attributes(slug: "a-new-value") }.to raise_error
  end


end
