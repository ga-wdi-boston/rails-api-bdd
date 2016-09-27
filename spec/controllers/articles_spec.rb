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
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      articles_collection = JSON.parse(response.body)
      expect(articles_collection).not_to be_nil
      expect(articles_collection.first['title']).to eq(article.title)
    end
  end

  describe 'GET show' do
    before(:each) { get :show, id: article.id }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      article_response = JSON.parse(response.body)
      expect(article_response).not_to be_nil
      puts 'article response is '
      puts article_response
    end

    it 'renders a hash' do
      article_response = JSON.parse(response.body)
      expect(article_response).to a_kind_of(Hash)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, article: article_params, format: :json
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      patch :update, id: article.id, article: article_diff, format: :json
    end

    skip 'is successful' do
    end

    skip 'renders a JSON response' do
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
    end
  end
end
