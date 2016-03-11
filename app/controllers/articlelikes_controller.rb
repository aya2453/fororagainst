class ArticlelikesController < ApplicationController
  def create
    @article = Article.where(id: params[:article_id])
    articlelike = current_user.articlelikes.build(article_id: params[:article_id])
    if articlelike.save
      render json: @article, only:[:likes_count]
    end
  end

  def destroy
    @article = Article.where(id: params[:article_id])
    articlelike = current_user.articlelikes.find_by(article_id: params[:article_id])
    if articlelike.destroy
      render json: @article, only:[:likes_count]
    end
  end
end
