require 'rails_helper'

RSpec.describe Article do
  it 'creates a new article' do
    # setup
    article = Article.create!({title: "I like turtles", body: "some text goes here"})

    #  execute
    #  verify
    expect(article).to be_a Article

    # cleanup
  end

  it 'is invalid without a body' do
    expect(Article.create(title: 'My title')).not_to be_valid
    # article.valid?
  end

  it 'is invalid without a title' do
    expect(Article.create(body: 'My body')).not_to be_valid
  end

  it 'is valid with a body and a title' do
    expect(Article.create(title: 'My title', body: 'My body')).to be_valid
  end

end