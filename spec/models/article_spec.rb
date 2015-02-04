require 'rails_helper'

RSpec.describe Article do
  describe '.create' do
    it 'creates a new article' do
      expect(Article.create()).to be_a Article
    end

    it 'is invalid without a body' do
      expect(Article.create(title: 'My title')).not_to be_valid
    end

    it 'is invalid without a title' do
      expect(Article.create(body: 'My body')).not_to be_valid
    end

    it 'is valid with a body and a title' do
      expect(Article.create(title: 'My title', body: 'My body')).to be_valid
    end
  end
end
