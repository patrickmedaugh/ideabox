require 'rails_helper'

RSpec.describe 'creation experience', :type => :feature do
  context 'a user' do
    let(:idea){
      Idea.create(title: "title", body: "body", quality: "swill")
    }
    it 'can create a new idea' do
      idea
      visit root_path
      click_link_or_button "New Idea"
      fill_in "Title", with: "sample"
      fill_in "Body", with: "xyzabc"
      fill_in "Quality", with: "swill"
      click_link_or_button "Save"
      expect(page).to have_content("xyzabc")
    end

    it 'can receive an error msg on invalid credentials' do
      idea
      visit root_path
      click_link_or_button "New Idea"
      fill_in "Title", with: "sample"
      fill_in "Body", with: "xyzabc"
      fill_in "Quality", with: "swell"
      click_link_or_button "Save"
      expect(page).to have_content("nuh uh")
    end
  end
end
