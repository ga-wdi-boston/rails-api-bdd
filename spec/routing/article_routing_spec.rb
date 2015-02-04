require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles#index' do
    expect(get('/articles')).to route_to('articles#index')
  end

  it 'routes GET /articles/new to the articles#new' do
    expect(get('/articles/new')).to route_to('articles#new')
  end

  it 'routes POST /articles to the articles controller' do
    expect(post('/articles')).to route_to('articles#create')
  end

  it 'routes GET /articles/1 to the articles#show' do
    expect(get('/articles/1')).to route_to(
      controller: 'articles',
      action: 'show',
      id: '1'
    )
  end

  it 'routes GET /articles/1/edit to the articles controller and sets id' do
    expect(get('articles/1/edit')).to route_to(
      controller: 'articles',
      action: 'edit',
      id: '1'
    )
  end

  it 'routes PATCH /articles/1 to the articles controller and sets id' do
    expect(patch('articles/1')).to route_to(
      controller: 'articles',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /articles/1 to the articles controller and sets id' do
    expect(delete('articles/1')).to route_to(
      controller: 'articles',
      action: 'destroy',
      id: '1'
    )
  end
end
