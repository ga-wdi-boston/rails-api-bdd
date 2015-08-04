require 'rails_helper'

RSpec.describe ArticlesController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  describe 'GET index' do
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      articles_collection = JSON.parse(response.body)
      expect(articles_collection).not_to be_nil
    end
  end

  describe 'GET show' do
    before(:each) do
      allow(Article).to receive(:find) { double(Article) }
    end

    it 'is successful' do
      get :show, id: 0

      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      get :show, id: 0

      article_response = JSON.parse(response.body)
      expect(article_response).not_to be_nil
    end
  end

  describe 'POST create' do
    before(:each) do
      article = double(Article)
      allow(Article).to receive(:new) { article }
      allow(article).to receive(:save) { true }

      post :create, article: article_params, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      article_response = JSON.parse(response.body)
      expect(article_response).not_to be_nil
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      article = double(Article)
      allow(Article).to receive(:find) { article }
      allow(article).to receive(:update) { true }

      patch :update, id: 0, article: article_diff, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      article_response = JSON.parse(response.body)
      expect(article_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      article = double(Article)
      allow(Article).to receive(:find) { article }
      allow(article).to receive(:destroy) { true }

      delete :destroy, id: 0, format: :json

      expect(response).to be_successful
      expect(response.body).to be_empty
    end
  end
end
