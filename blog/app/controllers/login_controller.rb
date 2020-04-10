    def new
        @article = Article.new
    end
    
    def index
        @articles = Article.all
    end
    
    def create
        @article = Article.new(article_params)
       # byebug
        
        if @article.save
            #byebug
            redirect_to @article
        else
            render 'new'
        end
    end