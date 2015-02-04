require 'rails_helper'

RSpec.describe 'routes for comments' do
  before(:all) do
    @article = Article.create!(title: 'Snowmageddon',body: "<p>At the same time, we are also tracking a separate system that will sweep from out of the northern Rockies and into the Plains by early Wednesday. Mainly light to moderate snowfall accumulations are forecast from the High Plains into the Midwest. After that, this system will sweep into the Northeast where the question has been whether it would have a significant impact on the region.</p>")
  end
  it "routes GET /articles/:article_id/comments to the comments controller" do
    expect(get("/articles/#{@article.id}/comments")).to route_to('comments#index')
  end
  it 'routes GET /articles/:article_id/comments/new to the comments controller' do
    expect(get("/articles/#{@article.id}/comments/new")).to route_to('comments#new')
  end
  it 'routes POST /articles/:article_id/comments to the comments controller' do
    expect(post("/articles/#{@article.id}/comments")).to route_to('comments#create')
  end
end