require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles#index action' do
    expect(get('/articles')).to route_to('articles#index')
  end

  it 'routes GET /articles/:id to the articles#show action' do
    expect(get('/articles/1')).to route_to(
      controller: 'articles',
      action: 'show',
      id: '1'
    )
  end

  it 'routes POST /articles to the articles#create action' do
    expect(post('/articles')).to route_to('articles#create')
  end

  it 'routes PATCH /articles/:id to the articles#update action' do
    expect(patch('/articles/1')).to route_to(
      controller: 'articles',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /articles/:id to the articles#destroy action' do
    expect(delete('/articles/1')).to route_to(
      controller: 'articles',
      action: 'destroy',
      id: '1'
    )
  end
end
