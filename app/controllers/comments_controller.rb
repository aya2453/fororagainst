class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(create_params)
    redirect_to article_path(@article)
  end

  private
    def create_params
      params.require(:comment).permit(:body, :status).merge(article_id: params[:article_id])
    end
end
