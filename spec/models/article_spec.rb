require 'rails_helper'

RSpec.describe Article do
  # http://api.rubyonrails.org/classes/ActiveRecord/Reflection/ClassMethods.html#method-i-reflect_on_association
  describe 'associations' do
    def association
      described_class.reflect_on_association(:comments)
    end

    it 'has an association with comments' do
      expect(association).to_not be_nil
      expect(association.name).to eq(:comments)
    end

    it 'has a set inverse of record' do
      expect(association.options[:inverse_of]).to_not be_nil
      expect(association.options[:inverse_of]).to eq(:article)
    end

    it 'deletes associated comments when destroyed' do
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'validates the presence of an article\'s title and content' do
      expect(
        Article.create(title: 'test', content: 'content of article')
      ).to be_valid
      expect(Article.create(content: 'content of article')).to be_invalid
    end
  end
end
