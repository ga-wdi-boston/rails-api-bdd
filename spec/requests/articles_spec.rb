# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Articles API' do
  def article_params
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def articles
    Article.all
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

  describe 'GET /articles' do
    it 'lists all articles' do
      get '/articles'

      expect(response).to be_success

      articles_response = JSON.parse(response.body)
      expect(articles_response.length).to eq(articles.count)
      expect(articles_response.first['title']).to eq(article['title'])
    end
  end

  describe 'GET /articles/:id' do
    it 'shows one article' do
      get "/articles/#{article.id}"

      expect(response).to be_success

      article_response = JSON.parse(response.body)

      expect(article_response['id']).not_to be_nil
      expect(article_response['title']).to eq(article_params[:title])
    end
  end

  describe 'DELETE /articles/:id' do
    it 'deletes an article' do
      # somehow send delete request to url
      delete "/articles/#{article.id}"

      # check response for success?
      expect(response).to be_success
      # response.body should be empty
      expect(response.body).to be_empty

      # article should be nil
      expect(article).to be_nil
    end
  end

  describe 'PATCH /articles/:id' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    it 'updates an article' do
      # send patch request
      patch "/articles/#{article.id}", params: { article: article_diff }
      # send the params with the diff

      # expect response is successful
      expect(response).to be_success
      # expect response body is empty
      expect(response.body).to be_empty
      # expect the article title is the updated article title
      expect(article[:title]).to eq(article_diff[:title])
    end
  end

  describe 'POST /articles' do
    skip 'creates an article' do
    end
  end
end
