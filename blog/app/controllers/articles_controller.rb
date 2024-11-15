class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end
    
    def index
        @articles = Article.all
    end
    
    def create
        @article = Article.new(article_params)
        @article.user_id = current_user
        @article.user = current_user
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    
    def like
        @article = Article.find(params[:id])
        Article.increment_counter(:likes, @article.id)
        redirect_to @article
    end
end

private
    def article_params
        params.require(:article).permit(:title, :text, :avatar)
    end