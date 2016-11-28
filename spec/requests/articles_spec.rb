require 'rails_helper'

RSpec.describe 'Articles API' do
  def article_params
    # parameters for creating an article
    {
      title: 'One Weird Trick',
      content: 'You won\'t believe what happens next...'
    }
  end

  def articles
    # returns a list of all articles
    Article.all
  end

  def article
    # returns the first article
    Article.first
  end

  before(:all) do
    # before each test, create an article using the
    # article params (above)
    Article.create!(article_params)
  end

  after(:all) do
    # deletes the article after all tests have run
    Article.delete_all
  end

  #feature test
  #we're describing what happens when a get request is made to
  # /articles
  describe 'GET /articles' do
    # we expect the get request to return a list of all the articles
    it 'lists all articles' do
      # get is a function that takes a string, and makes a get
      # request to that address
      get '/articles'
      # Expect to get a 20x response (success)
      expect(response).to be_success

      # sets the variable articles_response to the body of the
      # http response
      articles_response = JSON.parse(response.body)
      # expect the list of articles that we get from the server to be
      # the same length as the list of articles we created
      expect(articles_response.length).to eq(articles.count)
      # check that the first article's title is equal to the article title
      # that we createds
      expect(articles_response.first['title']).to eq(article['title'])
    end
  end

  describe 'GET /articles/:id' do
    skip 'shows one article' do
    end
  end

  describe 'DELETE /articles/:id' do
    skip 'deletes an article' do
    end
  end

  describe 'PATCH /articles/:id' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    skip 'updates an article' do
    end
  end

  describe 'POST /articles' do
    def new_article
      {
        title: 'Rachel is sick',
        content: 'Kids are the problem.'
      }
    end
    it 'creates an article' do
      post '/articles/', article: new_article

      expect(response).to be_success

      article_response = JSON.parse(response.body)
      expect(article_response['id']).not_to be_nil
      expect(article_response['title']).to eq(new_article[:title])
    end
  end
end
