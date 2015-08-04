require 'rails_helper'

RSpec.describe CommentsController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def comment_params
    {
      content: 'This is linkbait.'
    }
  end

  describe 'GET index' do
    before(:each) do
      article = double(Article)
      allow(Article).to receive(:find) { article }
      allow(article).to receive(:comments) { [double] }

      get :index, article_id: 0
    end

    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      article_comments_collection = JSON.parse(response.body)
      expect(article_comments_collection).not_to be_nil
    end
  end


  describe 'POST create' do
    before(:each) do
      article, comment = double(Article), double(Comment)
      allow(Article).to receive(:find) { article }
      allow(Comment).to receive(:new) { comment }
      allow(comment).to receive(:article=) { article }
      allow(comment).to receive(:save) { true }

      post :create, article_id: 0, comment: comment_params, format: :json
    end

    it 'is successful' do
      expect(response).to be_success
    end

    it 'renders a JSON response' do
      article_comment_response = JSON.parse(response.body)
      expect(article_comment_response).not_to be_nil
    end
  end
end
