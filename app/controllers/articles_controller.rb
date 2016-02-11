class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    Article.create(article_params)
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.permit(:title, :thumbnail, :content)
  end
end