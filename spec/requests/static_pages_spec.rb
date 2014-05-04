require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: 'Breeder CMS') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: '- Home') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About Us') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('title', text: full_title('Contact Us')) }
  end

  describe "displaying static pages" do
    let(:static_page) { FactoryGirl.create(:static_page) }

    before { visit static_page_path(static_page) }

    it { should have_selector('h1', text: static_page.title) }
    it { should have_selector('h2', text: static_page.subtitle) }
    it { should have_content(static_page.content) }
    it { should have_content(static_page.updated_at.to_s) }
  end
end
