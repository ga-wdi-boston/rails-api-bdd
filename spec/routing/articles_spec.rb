# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'routes for articles' do
  it 'routes GET /articles to the articles#index action' do
    expect(get('/articles')).to route_to('articles#index')
  end

  skip 'routes GET /articles/:id to the articles#show action' do
  end

  skip 'routes DELETE /articles/:id to the articles#destroy action' do
  end

  skip 'routes PATCH /articles/:id to the articles#update action' do
  end

  skip 'routes POST /articles to the articles#create action' do
  end
end
