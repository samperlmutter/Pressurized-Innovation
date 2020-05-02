class LikeController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.new
    @like.user_id = current_user.id
    @like.article_id = @article.id
    
    if @like.save
      redirect_to @article
    end
  end
  
  def delete
    @article = Article.find(params[:article_id])
    @like = Like.where(article_id: @article.id, user_id: current_user.id)
    Like.delete(@like)
    
    redirect_to @article
  end
  
  def index
    @likes = Like.where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end
end
