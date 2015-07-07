require 'rails_helper'

RSpec.describe Idea, type: :model do
  context 'with valid params' do
    let(:idea){
      Idea.create(title: "title", body: "body", quality: "swill")
    }
    it 'is valid' do
      expect(idea).to be_valid
    end

    it 'is invalidated when conditions are not met' do
      notitle = idea
      notitle.title = nil
      expect(notitle).not_to be_valid
      nobody = idea
      nobody.body = nil
      expect(nobody).not_to be_valid
      noquality = idea
      noquality.quality = "swell"
      expect(noquality).not_to be_valid
    end
  end
end
