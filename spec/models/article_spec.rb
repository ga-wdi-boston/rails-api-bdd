require 'rails_helper'

RSpec.describe Article do
  describe '.create' do
    it 'creates a new article' do
      expect(Article.create()).to be_a Article
    end
  end
end
