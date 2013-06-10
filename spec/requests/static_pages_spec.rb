require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Breeder CMS'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Breeder CMS')
    end
    
    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Breeder CMS")
    end

    it "should not have the custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => "- Home")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the correct title" do
      visit '/static_pages/about' 
      page.should have_selector('title', :text => '- About Us')
    end
  end

  describe "Contact page" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the correct title" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => '- Contact Us')
    end
  end
end
