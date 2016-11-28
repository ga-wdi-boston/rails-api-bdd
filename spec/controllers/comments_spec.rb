# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def article
    Article.first
  end

  def comment
    Comment.first
  end

  before(:all) do
    def comment_params
      article = Article.create!(article_params)

      {
        body: 'This is linkbait.',
        article_id: article.id
      }
    end

    Comment.create!(comment_params)
  end

  after(:all) do
    Comment.delete_all
    Article.delete_all
  end

  describe 'GET show' do
    before(:each) do
      get :show, params: { id: comment.id }
    end

    it 'is successful' do
      expect(response.status).to eq(200)
      expect(response).to be_success
    end

    it 'renders a JSON response' do
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
    end
  end

  describe 'PATCH update' do
    def comment_diff
      { body: 'First! ZOMGWTFBBQ' }
    end

    before(:each) do
      patch :update, params: { id: comment.id, comment: comment_diff },
                     format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      comment_response = JSON.parse(response.body)

      expect(comment_response['body']).to eq('First! ZOMGWTFBBQ')
    end
  end

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      delete :destroy, params: { id: comment.id }, format: :json

      expect(response).to be_successful
      expect(response.body).to be_empty
    end
  end
end
