require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles#index' do
    expect(get('/articles')).to route_to('articles#index')
  end
end