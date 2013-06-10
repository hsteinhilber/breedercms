require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Breeder CMS'" do
      visit root_path
      page.should have_selector('h1', :text => 'Breeder CMS')
    end
    
    it "should have the base title" do
      visit root_path
      page.should have_selector('title', :text => "Breeder CMS")
    end

    it "should not have the custom page title" do
      visit root_path
      page.should_not have_selector('title', :text => "- Home")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the correct title" do
      visit about_path
      page.should have_selector('title', :text => '- About Us')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit contact_path
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the correct title" do
      visit contact_path
      page.should have_selector('title', :text => '- Contact Us')
    end
  end
end
