require 'rails_helper'

RSpec.feature 'Managing articles' do
  scenario 'List all articles' do
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

    visit '/articles'

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

  scenario 'Read an article' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

    visit "/articles/#{article.id}"

    expect(page.find('h1')).to have_content 'One Stupid Trick'
    expect(page).to have_content "You won't believe what they did next..."
  end

  scenario 'Update an article' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

    visit "articles/#{article.id}/edit"

    fill_in 'Title', with: 'A Different Trick'
    fill_in 'Body', with: 'Much disbelief. Wow.'
    click_on 'Update Article'

    expect(page).to have_content(/success/i)
    expect(page.find('h1')).to have_content 'A Different Trick'
    expect(page).to have_content 'Much disbelief. Wow.'
  end

  scenario 'Delete an article' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")

    visit "articles/#{article.id}/edit"

    click_on 'Delete Article'

    expect(page).to have_content(/success/i)
  end
end
