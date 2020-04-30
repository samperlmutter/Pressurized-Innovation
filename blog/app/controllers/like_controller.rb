class LikeController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.new
    @like.user_id = current_user
    @like.article_id = @article
    
    @like.save
    redirect_to @article
  end
end
