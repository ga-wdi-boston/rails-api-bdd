require 'rails_helper'

RSpec.describe ArticlesController do
  describe 'index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @articles' do
      # setup
      articles = Article.all
      # execute
      get :index
      # verify
      expect(assigns(:articles)).to eq articles
    end
  end

end