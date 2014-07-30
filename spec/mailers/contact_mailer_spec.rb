require "spec_helper"

describe ContactMailer do
  before do
    SiteSettings.feedback_email = "harry.steinhilber@live.com"
  end

  subject { ContactMailer }

  it { should respond_to(:feedback) }
  
  describe "when sending feedback" do
    let(:mail) { ContactMailer.feedback }

    it "should have the proper to address" do
      mail.to.should include("harry.steinhilber@live.com")
    end

  end
end
