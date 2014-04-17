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
end
