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
    it 'is succesful' do
      get :index

      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      get :index

      articles_collection = JSON.parse(response.body)
      expect(articles_collection).to be_an(Array)
    end
  end

  describe 'GET show' do
    let(:article) { Article.first }

    it 'is successful' do
      get :show, id: article.id

      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      get :show, id: article.id

      article_response = JSON.parse(response.body)
      expect(article_response).to be_a(Hash)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, article: article_params, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      article_response = JSON.parse(response.body)
      expect(article_response['id']).not_to be_nil
      expect(article_response['title']).to eq(article_params[:title])
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      patch :update, id: article.id, article: article_diff, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      article_response = JSON.parse(response.body)
      expect(article_response['id']).to eq(article.id)
      expect(article_response['title']).to eq(article_diff[:title])
    end
  end

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      delete :destroy, id: article.id, format: :json

      expect(response).to be_successful
      expect(response.body).to be_empty
    end
  end
end
