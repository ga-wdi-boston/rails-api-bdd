require 'rails_helper'

RSpec.describe 'routes for article comments' do
  it 'routes GET /articles/:id/comments to the comments#index action' do
    expect(get('/articles/1/comments')).to route_to(
      controller: 'comments',
      action: 'index',
      article_id: '1'
    )
  end

  it 'routes POST /articles/:id/comments to the comments#create action' do
    expect(post('/articles/1/comments')).to route_to(
      controller: 'comments',
      action: 'create',
      article_id: '1'
    )
  end
end
