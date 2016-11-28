# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  after(:all) do
    Comment.delete_all
    Article.delete_all
  end

  describe 'model associations' do
    def association
      described_class.reflect_on_association(:article)
    end

    it 'belongs to an article' do
      expect(association).to_not be_nil
      expect(association.name).to eq(:article)
    end

    it 'has a set inverse of record' do
      expect(association.options[:inverse_of]).to_not be_nil
      expect(association.options[:inverse_of]).to eq(:comments)
    end

    it 'validates the presence of a comment\'s body' do
      article = Article.create(title: 'Pass the test', content: 'For reals')
      expect(Comment.create(body: 'content of comment', article_id: article.id))
        .to be_valid
      expect(Comment.create(article_id: article.id)).to be_invalid
    end
  end
end
