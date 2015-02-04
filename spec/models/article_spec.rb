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
end