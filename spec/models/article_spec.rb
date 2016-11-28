# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Article do
  after(:all) do
    Article.delete_all
  end

  describe 'model associations' do
    def association
      described_class.reflect_on_association(:comments)
    end

    it 'has many comments' do
      expect(association).to_not be_nil
      expect(association.name).to eq(:comments)
    end

    it 'has a set inverse of record' do
      expect(association.options[:inverse_of]).to_not be_nil
      expect(association.options[:inverse_of]).to eq(:article)
    end

    it 'validates the presence of a article\'s content' do
      expect(Article.create(title: 'You shall not pass')).to be_invalid
    end

    it 'validates the presence of a article\'s title' do
      expect(Article.create(content: 'You shall not pass')).to be_invalid
    end
  end
end
