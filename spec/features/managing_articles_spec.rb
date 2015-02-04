require 'rails_helper'

RSpec.feature 'Managing articles' do
  scenario 'List all articles' do

    # setup
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

    #  execute
    visit '/articles'

    # verify
    expect(page).to have_content 'Articles'
    expect(page).to have_selector 'article', count: 3

  end

  scenario 'Create an article' do
    visit '/articles/new'

    fill_in 'Title', with: 'One Stupid Trick'
    fill_in 'Body', with: "You won't believe what they did next..."
    click_on 'Create Article'

    expect(page).to have_content(/success/i)
  end

  scenario 'Read an article'
  scenario 'Update an article'
  scenario 'Delete an article'
end
