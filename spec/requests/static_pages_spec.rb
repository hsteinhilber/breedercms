require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('title', text: full_title('Contact Us')) }

    it { should have_selector('input', id: :name) }
    it { should have_selector('input', id: :from_email) }
    it { should have_selector('textarea', id: :comments) }
    it { should have_selector('input', id: :join_newsletter, type: :checkbox) }
  end

  describe "sending feedback" do
    describe "without a name" do
      before do
        fill_in :from_email, with: 'none@none.com'
        fill_in :comments, with: 'Lorem ipsum'
      end
      pending "test an email isn't sent and the user is shown an error"
    end

    describe "with an invalid email address" do
      before do
        fill_in :name, with: 'Example User'
        fill_in :from_email, with: 'bogus'
        fill_in :comments, with: 'Lorem ipsum'
      end
      pending "test that an email isn't sent and the user is shown an error"
    end

    describe "without an email address" do
      before do
        fill_in :name, with: 'Example User'
        fill_in :comments, with: 'Lorem ipsum'
      end
      pending "test that an email isn't sent and the user is shown an error"
    end

    describe "with valid information" do
      before do
        fill_in :name, with: 'Example User'
        fill_in :from_email, with: 'none@none.com'
        fill_in :comments, with: 'Lorem ipsum'
      end
      pending "test that an email is sent"
    end
  end

  describe "displaying static pages" do
    let(:static_page) { FactoryGirl.create(:static_page) }

    before { visit static_page_path(static_page) }

    it { should have_selector('title', text: static_page.title) }
    it { should have_selector('h1', text: static_page.title) }
    it { should have_selector('h2', text: static_page.subtitle) }
    it { should have_content(static_page.content) }
    it { should have_content(static_page.updated_at.to_s) }
  end
end
