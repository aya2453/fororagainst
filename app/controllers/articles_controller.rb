class ArticlesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @articles = Article.all
    @articlelikes = Articlelike.where(article_id: params[:id])
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
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end