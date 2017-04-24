# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  before(:all) do
    article = Article.create!(article_params)

    def comment_params
      {
        body: 'This is linkbait.',
        article_id: article.id
      }
    end

    Comment.create!(comment_params)
  end

  after(:all) do
    Comment.destroy_all
    Article.destroy_all
  end

  def article
    Article.first
  end

  describe 'GET articles#index' do
    before(:each) do
      get :index, params: { article_id: article.id }
    end

    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response with embedded comments' do
      article_comments_collection = JSON.parse(response.body)
      expect(article_comments_collection['comments']).not_to be_nil
    end
  end

  describe 'POST create' do
    before(:each) do
      def comment_params
        {
          body: 'New comment'
        }
      end
      post :create, params: {
        article_id: article.id,
        comment: comment_params
      }
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
