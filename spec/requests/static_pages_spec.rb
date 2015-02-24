require 'spec_helper'
require 'minitest/autorun'

describe "Static Pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App | " }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title("#{base_title}#{page_title}") }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { 'Home' }

    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title("#{base_title}About Us")
    click_link "Help"
    expect(page).to have_title("#{base_title}Help")
    click_link "Contact"
    expect(page).to have_title("#{base_title}Contact")
    # click_link "Sign up now!"
    # expect(page).to have_title("#{base_title}Sign up")
    click_link "sample app"
    expect(page).to have_title("#{base_title}Home")
 
  end 
end

