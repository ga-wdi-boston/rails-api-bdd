require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes GET /comments/:id to the comments#show action' do
    expect(get('/comments/1')).to route_to(
      controller: 'comments',
      action: 'show',
      id: '1'
    )
  end

  it 'routes PATCH /comments/:id to the comments#update action' do
    expect(patch('/comments/1')).to route_to(
      controller: 'comments',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /comments/:id to the comments#destroy action' do
    expect(delete('/comments/1')).to route_to(
      controller: 'comments',
      action: 'destroy',
      id: '1'
    )
  end
end
