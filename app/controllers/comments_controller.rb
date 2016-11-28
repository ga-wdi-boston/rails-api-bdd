class CommentsController < ApplicationController
  before_filter :set_comment, only: [:show, :update, :destroy]
  before_filter :set_article, only: [:index, :create]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
