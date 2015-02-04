require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @articles' do
      articles = Article.all
      get :index
      expect(assigns(:articles)).to eq articles
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @article' do
      article = Article.new
      get :new
      expect(assigns(:article)).to be_a_new Article
    end
  end

  describe 'POST create' do
    it 'has a 200 status code'
  end
end
