require 'rails_helper'
require 'byebug'

RSpec.feature 'Managing comments' do
  scenario 'List all of an article’s comments' do

    # setup
    @article = Article.create!(title: 'Snowmageddon',body: "<p>At the same time, we are also tracking a separate system that will sweep from out of the northern Rockies and into the Plains by early Wednesday. Mainly light to moderate snowfall accumulations are forecast from the High Plains into the Midwest. After that, this system will sweep into the Northeast where the question has been whether it would have a significant impact on the region.</p>")
    Comment.create!({body: "Yo, we're all gonna die",article: @article})

    # exercise
    visit "/articles/#{@article.id}/comments"

    # verify
    expect(page).to have_content 'Comments'
    expect(page).to have_selector '.comment', count: 1

  end

  scenario 'Create a article’s comment' do

    # setup
    @article = Article.create!(title: 'Snowmageddon',body: "<p>At the same time, we are also tracking a separate system that will sweep from out of the northern Rockies and into the Plains by early Wednesday. Mainly light to moderate snowfall accumulations are forecast from the High Plains into the Midwest. After that, this system will sweep into the Northeast where the question has been whether it would have a significant impact on the region.</p>")
    Comment.create!({body: "Yo, we're all gonna die",article: @article})

    # exercise
    visit new_article_comment_path(@article.id)

    fill_in 'Body', with: "Totes magotes."
    click_on 'Create Comment'

    # verify
    expect(page).to have_content(/Totes magotes/i)
  end
end