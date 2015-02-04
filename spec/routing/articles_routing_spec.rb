require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles controller' do
    expect(get('/articles')).to route_to('articles#index')
  end

  it 'routes GET /articles/new to the articles controller' do
    expect(get('/articles/new')).to route_to('articles#new')
  end

  it 'routes POST /articles to the articles controller' do
    expect(post('/articles')).to route_to('articles#create')
  end
end
