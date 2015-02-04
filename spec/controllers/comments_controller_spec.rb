require 'rails_helper'

RSpec.describe CommentsController do
  describe 'GET index' do
    it 'has 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @comments' do
      comments = Comment.all
      get :index
      expect(assigns(:comments)).to eq comments
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
      comment = Comment.new
      get :new
      expect(assigns(:comment)).to be_a_new Comment
    end
  end

  describe 'POST create' do
    before(:all) do
      @article = Article.create!(title: 'Snowmageddon',body: "<p>At the same time, we are also tracking a separate system that will sweep from out of the northern Rockies and into the Plains by early Wednesday. Mainly light to moderate snowfall accumulations are forecast from the High Plains into the Midwest. After that, this system will sweep into the Northeast where the question has been whether it would have a significant impact on the region.</p>")
    end
    it 'has a 200 status code' do
      post :create, comment: { body: "Yo dog, I hear you like testing", article: @article }
      expect(response.status).to eq 200
    end
    it 'redirects to the comment’s article' do
      post :create, comment: { body: "Yo dog, I hear you like testing", article: @article }
      expect(response).to redirect_to "/articles/#{@article.id}"
    end
  end
end