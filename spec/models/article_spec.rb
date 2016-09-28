require 'rails_helper'

RSpec.describe Article do
  it 'is defined' do
    expect(Article.new).to be_a(Article)
  end

  describe 'validations' do
    def valid_params
      { title: 'test', content: 'blahblah' }
    end

    it 'validates the presence of an article\'s title and content' do
      expect(Article.create(valid_params)).to be_valid
    end

    describe 'title' do
      it 'is invalid without content' do
        invalid_params = valid_params.select { |key, _| key == :title }
        expect(Article.create(invalid_params)).to be_invalid
      end
    end
    describe 'content' do
      it 'is invalid without title' do
        invalid_params = valid_params.select { |key, _| key == :content }
        expect(Article.create(invalid_params)).to be_invalid
      end
    end
  end

  describe 'comments association' do
    def comments_association
      described_class.reflect_on_association(:comments)
    end

    it 'has the name comments' do
      expect(comments_association).to_not be_nil
      expect(comments_association.name).to eq(:comments)
    end

    it 'has a set inverse of record' do
      expect(comments_association.options[:inverse_of]).to_not be_nil
      expect(comments_association.options[:inverse_of]).to eq(:article)
    end

    it 'deletes associated comments when destroyed' do
      expect(comments_association.options[:dependent]).to eq(:destroy)
    end
  end
end
