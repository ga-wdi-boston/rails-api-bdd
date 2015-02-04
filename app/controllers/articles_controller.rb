class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article successfully created.'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      flash[:success] = 'Article successfully updated.'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = 'Article successfully deleted.'
    redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
