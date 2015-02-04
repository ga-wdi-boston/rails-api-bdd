class CommentsController < ApplicationController

  def index
    article = Article.find(params[:article_id])
    @comments = article.comments
  end

  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article = Article.find(params[:article_id])
    if @comment.save
      redirect_to article_comments_path(@comment.article.id)
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body,:article_id)
  end
end