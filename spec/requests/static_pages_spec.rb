require 'spec_helper'

describe "StaticPages" do

  #avoid duplicate declaration
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/'
      response.status.should be(200)
    end
  end

  subject { page }


  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end


  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
    #it {should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")}
    #it {should_not have_selector('title', :text => '#{base_title} | Home')}
  end

  describe "Help page" do
    before { visit help_path }
    it {should have_content('Help')}
    #it {should have_selector('title', :text => "#{base_title} | Help")}
  end

  describe "About page" do
    before { visit about_path }
    it {should have_content('About Us')}
    it {should have_selector('title', :text => "#{base_title} | About Us")}
  end

  describe "Contact Us" do
    before { visit contact_path }
    it {should have_content('Contact Us')}
    #it {should have_selector('title', :text => "#{base_title} | Contact Us")  }
  end


  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should #fill in
  end

end#StaticPages
