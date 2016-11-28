# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments API' do
  def comments
    Comment.all
  end

  def comment
    Comment.first
  end

  before(:all) do
    def comment_params
      Article.create!(
        title: 'HORSES',
        content: 'Horses are the best.'
      )
      article = Article.last

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

  describe 'GET /comments/:id' do
    it 'shows one comment' do
      get "/comments/#{comment.id}"

      expect(response).to be_success

      comment_response = JSON.parse(response.body)
      expect(comment_response['id']).to eq(comment.id)
      expect(comment_response['body']).to eq(comment.body)
    end
  end

  describe 'PATCH /comments/:id' do
    def comment_diff
      { body: 'First! ZOMGWTFBBQ' }
    end

    it 'updates an comment' do
      patch "/comments/#{comment.id}", params: { comment: comment_diff }

      expect(response).to be_success

      comment_response = JSON.parse(response.body)
      expect(comment_response['id']).to eq(comment.id)
      expect(comment_response['body']).to eq(comment_diff[:body])
    end
  end

  describe 'DELETE /comments/:id' do
    it 'deletes an comment' do
      delete "/comments/#{comment.id}", comment: { id: comment.id }

      expect(response).to be_success
      expect(response.body).to be_empty
    end
  end
end
