require 'rails_helper'

RSpec.describe Article do
  it 'is an article' do
    expect(Article.new).to be_a(Article)
  end
end
