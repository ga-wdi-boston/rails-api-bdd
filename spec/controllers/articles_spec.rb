# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ArticlesController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def article
    Article.first
  end

  before(:all) do
    Article.create!(article_params)
  end

  after(:all) do
    Article.delete_all
  end

  describe 'GET index' do
    it 'is successful' do
      get :index
      expect(response.status).to eq(200) # be_success
    end

    it 'renders a JSON response' do
      get :index
      articles_collection = JSON.parse(response.body)

      expect(articles_collection).not_to be_nil
      expect(articles_collection.first['title']).to eq(article['title'])
    end
  end

  describe 'GET show' do
    before(:each) {
      get :show, params: { id: article.id }
    }
    it 'is successful' do
    end

    it 'renders a JSON response' do
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      patch :update, id: article.id,
                     params: { article: article_diff }
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { article: article_params }
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end
end
