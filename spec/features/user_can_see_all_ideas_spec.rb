require 'rails_helper'

RSpec.describe 'user', :type => :feature do
  context 'when visiting root' do
    let(:idea){
      Idea.create(title: "title", body: "body", quality: "swill")
    }
    it 'can see an index of ideas' do
      idea
      visit root_path
      expect(page).to have_content("title")
      expect(page).to have_content("body")
      expect(page).to have_content("swill")
    end
  end
end
