require 'rails_helper'

RSpec.describe 'Article Comments API' do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def comment_params
    {
      body: 'This is linkbait.'
    }
  end

  def article
    Article.first
  end

  def article_comments
    article.comments
  end

  def article_first_comment
    article_comments.first
  end

  before(:all) do
    Article.create!(article_params)
    article.comments << Comment.create!(comment_params)

    # Create an unassociated comment to prove scoping
    Comment.create!(comment_params)
  end

  after(:all) do
    Article.destroy_all
  end

  describe 'GET /articles/:id/comments' do
    it 'lists all comments for a given article' do
      get "/articles/#{article.id}/comments"

      expect(response).to be_success

      article_comments_collection = JSON.parse(response.body)
      puts article_comments_collection
      puts article_first_comment
      expect(article_comments_collection.length).to eq(article_comments.count)
      expect(
         article_comments_collection.first['body']
       ).to eq(article_first_comment['body'])
    end
  end

  describe 'POST /articles/:id/comments' do
    it 'creates an comment on a given article' do
      post "/articles/#{article.id}/comments", comment: comment_params, format: :json

      expect(response).to be_success

      article_comment_response = JSON.parse(response.body)
      expect(article_comment_response['id']).not_to be_nil
      expect(article_comment_response['article_id']).not_to be_nil
      expect(article_comment_response['content']).to eq(comment_params[:content])
    end
  end
end
