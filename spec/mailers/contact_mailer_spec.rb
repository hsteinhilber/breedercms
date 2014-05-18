require "spec_helper"

describe ContactMailer do
  before do
    SiteSettings.admin_email = "harry.steinhilber@live.com"
  end

  subject { ContactMailer }

  it { should respond_to(:contact_admin) }
  
  describe "when sending an email to the admin" do
    let(:mail) { ContactMailer.contact_admin }

    it "should have the proper to address" do
      mail.to.should include("harry.steinhilber@live.com")
    end


  end
end
