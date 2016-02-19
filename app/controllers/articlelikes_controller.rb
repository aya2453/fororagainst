class ArticlelikesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    articlelike = current_user.articlelikes.build(article_id: article.id)
    articlelike.save
    redirect_to root_path
  end

  def destroy
    article = Article.find(params[:article_id])
    articlelike = current_user.articlelikes.find_by(article_id: article.id)
    articlelike.destroy
    redirect_to root_path
  end
end
