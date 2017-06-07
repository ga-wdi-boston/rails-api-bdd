# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_filter :set_article, only: [:show, :update, :destroy]

  def index
    render json: Article.all
  end

  def show
  end

  def destroy
  end

  def update
  end

  def create
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
