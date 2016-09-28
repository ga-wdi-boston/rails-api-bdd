class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      head :no_content
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
