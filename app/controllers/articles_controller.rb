class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    # implied: render 'show'
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:success] = 'Article successfully created'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end