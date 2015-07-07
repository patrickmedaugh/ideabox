require 'rails_helper'

RSpec.describe 'user', :type => :feature do
  context 'when visiting ideas index' do
    let(:idea){
      Idea.create(title: "title", body: "body", quality: "swill")
    }
    it 'can look at an individual idea' do
      idea
      visit root_path
      click_link_or_button "title"
      expect(page).to have_content("title")
      expect(page).to have_content("body")
      expect(page).to have_content("swill")
    end
  end
end
