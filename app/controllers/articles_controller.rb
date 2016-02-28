class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_article, only: [:show, :edit, :pro, :con,:destroy,:update]

  def index
    params[:sort_param] = %w{likes_count created_at}.include?(params[:sort_param]) ? params[:sort_param] : 'likes_count'
    @articles = Article.all.order "#{params[:sort_param]} DESC"
    @articlelikes = Articlelike.where(article_id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
  end

  def show

  end

  def edit
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
    end
    redirect_to :back
  end

  def update
    if @article.user_id == current_user.id
      @article.update(article_params)
    end
  end

  def pro
    @article.upvote_by current_user
    redirect_to :back
  end

  def con
    @article.downvote_by current_user
    redirect_to :back
  end

  def search
    @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  private
    def article_params
      params.require(:article).permit(:title, :thumbnail, :content,:user_id)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end